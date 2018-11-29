// <auto-generated>
// Code generated by Microsoft (R) AutoRest Code Generator.
// Changes may cause incorrect behavior and will be lost if the code is
// regenerated.
// </auto-generated>

namespace Gcpe.Hub.Services.Legacy
{
    using Models;
    using System.Collections;
    using System.Collections.Generic;
    using System.Threading;
    using System.Threading.Tasks;

    /// <summary>
    /// Extension methods for Distribution.
    /// </summary>
    public static partial class DistributionExtensions
    {
            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='smtpAddress'>
            /// </param>
            /// <param name='emailSubject'>
            /// </param>
            /// <param name='receivedDate'>
            /// </param>
            /// <param name='hardBounced'>
            /// </param>
            public static BounceLogResult LogBounce(this IDistribution operations, string smtpAddress, string emailSubject, System.DateTimeOffset receivedDate, bool hardBounced)
            {
                return operations.LogBounceAsync(smtpAddress, emailSubject, receivedDate, hardBounced).GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='smtpAddress'>
            /// </param>
            /// <param name='emailSubject'>
            /// </param>
            /// <param name='receivedDate'>
            /// </param>
            /// <param name='hardBounced'>
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<BounceLogResult> LogBounceAsync(this IDistribution operations, string smtpAddress, string emailSubject, System.DateTimeOffset receivedDate, bool hardBounced, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.LogBounceWithHttpMessagesAsync(smtpAddress, emailSubject, receivedDate, hardBounced, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            public static bool? IsNewsOnDemandEnabled(this IDistribution operations)
            {
                return operations.IsNewsOnDemandEnabledAsync().GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<bool?> IsNewsOnDemandEnabledAsync(this IDistribution operations, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.IsNewsOnDemandEnabledWithHttpMessagesAsync(null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            public static void TryRunningDailyDigest(this IDistribution operations)
            {
                operations.TryRunningDailyDigestAsync().GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task TryRunningDailyDigestAsync(this IDistribution operations, CancellationToken cancellationToken = default(CancellationToken))
            {
                (await operations.TryRunningDailyDigestWithHttpMessagesAsync(null, cancellationToken).ConfigureAwait(false)).Dispose();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='article'>
            /// </param>
            public static bool? AddNewsOnDemandEntry(this IDistribution operations, Article article)
            {
                return operations.AddNewsOnDemandEntryAsync(article).GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='article'>
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<bool?> AddNewsOnDemandEntryAsync(this IDistribution operations, Article article, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.AddNewsOnDemandEntryWithHttpMessagesAsync(article, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='articles'>
            /// </param>
            public static IList<string> AddNewsOnDemandPosts(this IDistribution operations, IList<Article> articles)
            {
                return operations.AddNewsOnDemandPostsAsync(articles).GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='articles'>
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<IList<string>> AddNewsOnDemandPostsAsync(this IDistribution operations, IList<Article> articles, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.AddNewsOnDemandPostsWithHttpMessagesAsync(articles, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='absoluteUri'>
            /// </param>
            public static bool? RemoveNewsOnDemandEntry(this IDistribution operations, string absoluteUri)
            {
                return operations.RemoveNewsOnDemandEntryAsync(absoluteUri).GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='absoluteUri'>
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<bool?> RemoveNewsOnDemandEntryAsync(this IDistribution operations, string absoluteUri, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.RemoveNewsOnDemandEntryWithHttpMessagesAsync(absoluteUri, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='distributionLists'>
            /// </param>
            public static int? NewsOnDemandSubscriberCount(this IDistribution operations, IList<string> distributionLists)
            {
                return operations.NewsOnDemandSubscriberCountAsync(distributionLists).GetAwaiter().GetResult();
            }

            /// <param name='operations'>
            /// The operations group for this extension method.
            /// </param>
            /// <param name='distributionLists'>
            /// </param>
            /// <param name='cancellationToken'>
            /// The cancellation token.
            /// </param>
            public static async Task<int?> NewsOnDemandSubscriberCountAsync(this IDistribution operations, IList<string> distributionLists, CancellationToken cancellationToken = default(CancellationToken))
            {
                using (var _result = await operations.NewsOnDemandSubscriberCountWithHttpMessagesAsync(distributionLists, null, cancellationToken).ConfigureAwait(false))
                {
                    return _result.Body;
                }
            }

    }
}
