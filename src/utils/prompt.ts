import inquirer from "inquirer";
import chalk from "chalk";

export async function confirm(message: string, defaultValue = false): Promise<boolean> {
  const { answer } = await inquirer.prompt([
    {
      type: "confirm",
      name: "answer",
      message,
      default: defaultValue,
    },
  ]);
  return answer;
}

export async function input(message: string, defaultValue?: string): Promise<string> {
  const { value } = await inquirer.prompt([
    {
      type: "input",
      name: "value",
      message,
      default: defaultValue,
    },
  ]);
  return value;
}

export async function select<T>(
  message: string,
  choices: Array<{ name: string; value: T }>
): Promise<T> {
  const { selected } = await inquirer.prompt([
    {
      type: "list",
      name: "selected",
      message,
      choices,
    },
  ]);
  return selected;
}

export async function checkbox<T>(
  message: string,
  choices: Array<{ name: string; value: T; checked?: boolean }>
): Promise<T[]> {
  const { selected } = await inquirer.prompt([
    {
      type: "checkbox",
      name: "selected",
      message,
      choices,
    },
  ]);
  return selected;
}

