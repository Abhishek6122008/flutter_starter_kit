// SKELETON: Gemini LLM contract for Antigravity-based agent workflows.
//
// IMPORTANT:
// - This Flutter starter kit must NOT call Gemini directly.
// - All Gemini usage must be orchestrated by Google Antigravity agents.

/// Contract for a Gemini-based LLM provider.
///
/// Implementations are generated and executed
/// by Antigravity agent workflows only.
abstract class GeminiApi {
  /// Generates a response for a prompt using Gemini.
  ///
  /// SKELETON HOOK:
  /// - model selection
  /// - request formatting
  /// - safety settings
  /// - rate limiting
  /// are handled by Antigravity workflows.
  Future<String> generate(String prompt);
}
