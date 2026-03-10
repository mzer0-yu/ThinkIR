#include "ThinkIR.hpp"

/*
 * Goal: [Insert your goal here]
 * Context: [Add any relevant context]
 */

LLMctx main() {
    // Set domain context and purpose
    LLMctx logic = LLMctx::keyword("[Domain/Task Type]");
    logic.purpose("[Clear objective statement]");

    // Optional: Add constraints
    logic.st("[Specific requirements or constraints]");

    // Create logical reasoning nodes
    id t1 = logic.think("[First logical deduction or observation]");
    id t2 = logic.think("[Second logical deduction or observation]");
    id t3 = logic.think("[Conclusion or final output requirement]");

    // Establish logical dependencies
    logic.link(t1, t2);
    logic.link(t2, t3);

    // Create a pure container for final output (recommended pattern)
    LLMctx pure;

    // Generate and push artifacts
    string intent = "[Describe what you want to generate - e.g., 'Python function for data processing']";
    pure.push(logic.program(intent));

    // Optional: Add additional artifacts
    // pure.push(logic.create("[Documentation or explanation]"));

    return pure;
}