using System.Windows;

namespace MaterialCalculator
{
    public partial class MainWindow : Window
    {
        private string display = "0";
        private string operand1 = "";
        private string operand2 = "";
        private string currentOperator = "";
        private bool operatorPressed = false;

        public MainWindow()
        {
            InitializeComponent();
            UpdateDisplay();
        }

        private void Number_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            string number = button?.Content.ToString() ?? "";

            if (operatorPressed)
            {
                display = "0";
                operatorPressed = false;
            }

            if (display == "0" && number != "0")
            {
                display = number;
            }
            else if (display != "0" || number == "0")
            {
                display += number;
            }

            UpdateDisplay();
        }

        private void Decimal_Click(object sender, RoutedEventArgs e)
        {
            if (operatorPressed)
            {
                display = "0";
                operatorPressed = false;
            }

            if (!display.Contains("."))
            {
                display += ".";
                UpdateDisplay();
            }
        }

        private void Operator_Click(object sender, RoutedEventArgs e)
        {
            var button = sender as Button;
            string newOperator = button?.Content.ToString() ?? "";

            if (!string.IsNullOrEmpty(operand1) && !operatorPressed && currentOperator != "")
            {
                Equals_Click(null, null);
            }

            operand1 = display;
            currentOperator = newOperator;
            operatorPressed = true;
        }

        private void Equals_Click(object sender, RoutedEventArgs e)
        {
            if (string.IsNullOrEmpty(operand1) || string.IsNullOrEmpty(currentOperator) || operatorPressed)
            {
                return;
            }

            operand2 = display;

            if (double.TryParse(operand1, out double num1) && double.TryParse(operand2, out double num2))
            {
                double result = 0;

                switch (currentOperator)
                {
                    case "+":
                        result = num1 + num2;
                        break;
                    case "−":
                        result = num1 - num2;
                        break;
                    case "×":
                        result = num1 * num2;
                        break;
                    case "÷":
                        if (num2 != 0)
                            result = num1 / num2;
                        else
                        {
                            display = "Cannot divide by 0";
                            UpdateDisplay();
                            return;
                        }
                        break;
                    case "%":
                        result = num1 % num2;
                        break;
                }

                display = FormatResult(result);
                operand1 = display;
                operand2 = "";
                currentOperator = "";
                operatorPressed = true;
                UpdateDisplay();
            }
        }

        private void Clear_Click(object sender, RoutedEventArgs e)
        {
            display = "0";
            operand1 = "";
            operand2 = "";
            currentOperator = "";
            operatorPressed = false;
            UpdateDisplay();
        }

        private void Backspace_Click(object sender, RoutedEventArgs e)
        {
            if (display.Length > 1)
            {
                display = display.Substring(0, display.Length - 1);
            }
            else
            {
                display = "0";
            }

            UpdateDisplay();
        }

        private void ToggleSign_Click(object sender, RoutedEventArgs e)
        {
            if (double.TryParse(display, out double num))
            {
                num = -num;
                display = FormatResult(num);
                UpdateDisplay();
            }
        }

        private void SquareRoot_Click(object sender, RoutedEventArgs e)
        {
            if (double.TryParse(display, out double num))
            {
                if (num < 0)
                {
                    display = "Cannot take square root of negative";
                }
                else
                {
                    num = System.Math.Sqrt(num);
                    display = FormatResult(num);
                }

                UpdateDisplay();
            }
        }

        private void Reciprocal_Click(object sender, RoutedEventArgs e)
        {
            if (double.TryParse(display, out double num))
            {
                if (num == 0)
                {
                    display = "Cannot divide by 0";
                }
                else
                {
                    num = 1 / num;
                    display = FormatResult(num);
                }

                UpdateDisplay();
            }
        }

        private void UpdateDisplay()
        {
            DisplayBox.Text = display;
        }

        private string FormatResult(double result)
        {
            if (double.IsInfinity(result) || double.IsNaN(result))
            {
                return "Error";
            }

            // Remove trailing zeros and unnecessary decimal points
            string formatted = result.ToString("G15");
            return formatted;
        }
    }
}
