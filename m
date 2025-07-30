Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8E9B1650D
	for <lists+samba-technical@lfdr.de>; Wed, 30 Jul 2025 18:55:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=KSPB0UNbVm7YzmyV16F2Z5ixvsCCzRwxR55AuZc++gs=; b=ngG0R8LBKNKivOE4gYyjP7XoEk
	AHPhKRBmdBRUHsFpcTzwiHjIeNMkwtV3YQSBnAPOIkpDZfwi1xFGK7JBJr1vsjyVaS7XOdTFty585
	53ygvQQQS5T73wQ76peMwROwgCnnmKw5i07d/O3JnWR6D2zOqSrleyDBqogGbeV25WDtYIHLQ807I
	L+Khtmzf/wXFg5vnlqhB5GNQ2Y1Pvh1tBsDqW1Urgtrf6YsZMN3ITipXvMyhLfYc+iBrdigeYgDOI
	lEqEycI9xp/Vjoo69k9vJmxdVGsSkBlnOb3N52Kd+SK5RS0PNkpAJOMPiRWibi5rUvMdhEIUHba9k
	6EjsDH5A==;
Received: from ip6-localhost ([::1]:59156 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uhA4U-00C2Rg-Ip; Wed, 30 Jul 2025 16:54:30 +0000
Received: from air.basealt.ru ([193.43.8.18]:42796) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uhA4P-00C2RZ-Tw
 for samba-technical@lists.samba.org; Wed, 30 Jul 2025 16:54:28 +0000
Received: from [10.64.128.185] (unknown [193.43.9.250])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id 5F90123372;
 Wed, 30 Jul 2025 19:54:21 +0300 (MSK)
Message-ID: <8f2ad82d-0dd4-4195-b414-59f25f859a9e@altlinux.org>
Date: Wed, 30 Jul 2025 20:54:20 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/smb/client/fs_context: Add hostname option for CIFS
 module to work with domain-based dfs resources with Kerberos authentication
To: Steve French <smfrench@gmail.com>
References: <20250516152201.201385-1-alxvmr@altlinux.org>
 <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
 <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
 <CAH2r5mtG5pwFMRtu3EeXKPBdq0LJwjt84SbGtL0J4QuCg+AsgQ@mail.gmail.com>
 <CAH2r5msnTMCHJ9kZmFWCbUUUnejOLv8mzGussaidc3yj3nk+qQ@mail.gmail.com>
Content-Language: en-US, ru
In-Reply-To: <CAH2r5msnTMCHJ9kZmFWCbUUUnejOLv8mzGussaidc3yj3nk+qQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: "Discussions on Samba internals. For general questions please
 subscribe to the list samba@lists.samba.org"
 <samba-technical.lists.samba.org>
List-Unsubscribe: <https://lists.samba.org/mailman/options/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/samba-technical/>
List-Post: <mailto:samba-technical@lists.samba.org>
List-Help: <mailto:samba-technical-request@lists.samba.org?subject=help>
List-Subscribe: <https://lists.samba.org/mailman/listinfo/samba-technical>,
 <mailto:samba-technical-request@lists.samba.org?subject=subscribe>
From: Maria Alexeeva via samba-technical <samba-technical@lists.samba.org>
Reply-To: alxvmr@altlinux.org
Cc: pc@manguebit.com, linux-cifs@vger.kernel.org,
 Ivan Volchenko <ivolchenko86@gmail.com>, samba-technical@lists.samba.org,
 Tom Talpey <tom@talpey.com>, Vitaly Chikunov <vt@altlinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Steve,
It seems some of the discussion with review comments fell outside this
thread (I can only find vt@altlinux.org Vitaly Chikunov's remarks).
Could you please point me to where the rest of the feedback can be
found (e.g., about fixing the noisy warning the patch adds and
other comments)?

An updated patch for fs/smb/client/fs_context has been prepared, renaming
the option to dfs_domain_hostname. There's suggestion to further rename
it to dfs_server_hostname - what are your thoughts on this?

The patches will follow in subsequent messages.

Thanks!

On 7/25/25 02:50, Steve French via samba-technical wrote:
> Maria,
> Since this looks like it depends on a cifs-utils change, can you
> update your kernel patch with review comments (e.g. changing mount
> parm to "dfs_domain_hostname", and there were at least two others in
> the thread, e.g. fixing the noisy warning that the patch adds) and
> then show the cifs-utils change, so we can make the upcoming merge
> window.
> 
> On Thu, Jul 24, 2025 at 5:14 PM Steve French <smfrench@gmail.com> wrote:
>>
>> I will update the mount parm name, similar to what Tom suggested to
>> "dfs_domain_hostname" to be less confusing.
>>
>> Let me know if you had a v2 of the patch with other changes
>>
>> On Thu, Jul 3, 2025 at 8:00 AM Maria Alexeeva via samba-technical
>> <samba-technical@lists.samba.org> wrote:
>>>
>>> On 6/14/25 07:42, Vitaly Chikunov wrote:
>>>> Maria,
>>>>
>>>> On Fri, May 16, 2025 at 07:22:01PM +0400, Maria Alexeeva wrote:
>>>>> Paths to domain-based dfs resources are defined using the domain name
>>>>> of the server in the format:
>>>>> \\DOMAIN.NAME>\<dfsroot>\<path>
>>>>>
>>>>> The CIFS module, when requesting a TGS, uses the server name
>>>>> (<DOMAIN.NAME>) it obtained from the UNC for the initial connection.
>>>>> It then composes an SPN that does not match any entities
>>>>> in the domain because it is the domain name itself.
>>>> For a casual reader like me it's hard to understand (this abbreviation
>>>> filled message) what it's all about. And why we can't just change system
>>>> hostname for example.
>>>
>>> This option is needed to transfer the real name of the server to which
>>> the connection is taking place,
>>> when using the UNC path in the form of domain-based DFS. The system
>>> hostname has nothing to do with it.
>>>
>>>> Also, the summary (subject) message is 180 character which is way above
>>>> 75 characters suggested in submitting-patches.rst.
>>>>
>>>>> To eliminate this behavior, a hostname option is added, which is
>>>>> the name of the server to connect to and is used in composing the SPN.
>>>>> In the future this option will be used in the cifs-utils development.
>>>>>
>>>>> Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
>>>>> Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
>>>>> ---
>>>>>    fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++------
>>>>>    fs/smb/client/fs_context.h |  3 +++
>>>>>    2 files changed, 32 insertions(+), 6 deletions(-)
>>>>>
>>>>> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
>>>>> index a634a34d4086..74de0a9de664 100644
>>>>> --- a/fs/smb/client/fs_context.c
>>>>> +++ b/fs/smb/client/fs_context.c
>>>>> @@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
>>>>>       fsparam_string("password2", Opt_pass2),
>>>>>       fsparam_string("ip", Opt_ip),
>>>>>       fsparam_string("addr", Opt_ip),
>>>>> +    fsparam_string("hostname", Opt_hostname),
>>>>>       fsparam_string("domain", Opt_domain),
>>>>>       fsparam_string("dom", Opt_domain),
>>>>>       fsparam_string("srcaddr", Opt_srcaddr),
>>>>> @@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs_context *fc)
>>>>>               return -ENOENT;
>>>>>       }
>>>>>
>>>>> +    if (ctx->got_opt_hostname) {
>>>>> +            kfree(ctx->server_hostname);
>>>>> +            ctx->server_hostname = ctx->opt_hostname;
>>>> I am not familiar with the smb codebase but are you sure this will not
>>>> cause a race?
>>>
>>> The race condition will not occur.
>>> ctx->server_hostname is also used in smb3_parse_devname inside
>>> smb3_fs_context_parse_param.
>>> smb3_fs_context_parse_param is called earlier than the updated
>>> smb3_fs_context_validate, which is called inside smb3_get_tree:
>>>
>>> static const struct fs_context_operations smb3_fs_context_ops = {
>>>    .free   = smb3_fs_context_free,
>>>    .parse_param  = smb3_fs_context_parse_param,
>>>    .parse_monolithic = smb3_fs_context_parse_monolithic,
>>>    .get_tree  = smb3_get_tree,
>>>    .reconfigure  = smb3_reconfigure,
>>> };
>>>
>>>>> +            pr_notice("changing server hostname to name provided in hostname= option\n");
>>>>> +    }
>>>>> +
>>>>>       if (!ctx->got_ip) {
>>>>>               int len;
>>>>> -            const char *slash;
>>>>>
>>>>> -            /* No ip= option specified? Try to get it from UNC */
>>>>> -            /* Use the address part of the UNC. */
>>>>> -            slash = strchr(&ctx->UNC[2], '\\');
>>>>> -            len = slash - &ctx->UNC[2];
>>>>> +            /*
>>>>> +             * No ip= option specified? Try to get it from server_hostname
>>>>> +             * Use the address part of the UNC parsed into server_hostname
>>>>> +             * or hostname= option if specified.
>>>>> +             */
>>>>> +            len = strlen(ctx->server_hostname);
>>>>>               if (!cifs_convert_address((struct sockaddr *)&ctx->dstaddr,
>>>>> -                                      &ctx->UNC[2], len)) {
>>>>> +                                      ctx->server_hostname, len)) {
>>>>>                       pr_err("Unable to determine destination address\n");
>>>>>                       return -EHOSTUNREACH;
>>>>>               }
>>>>> @@ -1518,6 +1526,21 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>>>>>               }
>>>>>               ctx->got_ip = true;
>>>>>               break;
>>>>> +    case Opt_hostname:
>>>>> +            if (strnlen(param->string, CIFS_NI_MAXHOST) == CIFS_NI_MAXHOST) {
>>>>> +                    pr_warn("host name too long\n");
>>>>> +                    goto cifs_parse_mount_err;
>>>>> +            }
>>>>> +
>>>>> +            kfree(ctx->opt_hostname);
>>>>> +            ctx->opt_hostname = kstrdup(param->string, GFP_KERNEL);
>>>>> +            if (ctx->opt_hostname == NULL) {
>>>>> +                    cifs_errorf(fc, "OOM when copying hostname string\n");
>>>>> +                    goto cifs_parse_mount_err;
>>>>> +            }
>>>>> +            cifs_dbg(FYI, "Host name set\n");
>>>>> +            ctx->got_opt_hostname = true;
>>>>> +            break;
>>>>>       case Opt_domain:
>>>>>               if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
>>>>>                               == CIFS_MAX_DOMAINNAME_LEN) {
>>>>> diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
>>>>> index 9e83302ce4b8..cf0478b1eff9 100644
>>>>> --- a/fs/smb/client/fs_context.h
>>>>> +++ b/fs/smb/client/fs_context.h
>>>>> @@ -184,6 +184,7 @@ enum cifs_param {
>>>>>       Opt_pass,
>>>>>       Opt_pass2,
>>>>>       Opt_ip,
>>>>> +    Opt_hostname,
>>>>>       Opt_domain,
>>>>>       Opt_srcaddr,
>>>>>       Opt_iocharset,
>>>>> @@ -214,6 +215,7 @@ struct smb3_fs_context {
>>>>>       bool gid_specified;
>>>>>       bool sloppy;
>>>>>       bool got_ip;
>>>>> +    bool got_opt_hostname;
>>>>>       bool got_version;
>>>>>       bool got_rsize;
>>>>>       bool got_wsize;
>>>>> @@ -226,6 +228,7 @@ struct smb3_fs_context {
>>>>>       char *domainname;
>>>>>       char *source;
>>>>>       char *server_hostname;
>>>>> +    char *opt_hostname;
>>>> Perhaps, smb3_fs_context_dup and smb3_cleanup_fs_context_contents should
>>>> be aware of these new fields too.
>>>
>>> smb3_cleanup_fs_context_contents should be aware of these new fields too.
>>>
>>> Clearing in smb3_cleanup_fs_context_contents is not necessary, because
>>> if opt_hostname != NULL,
>>> then the pointer in server_hostname is replaced (it is pre-cleared by
>>> kfree), respectively, everything
>>> will be cleared by itself with the current code.
>>>
>>> In smb3_fs_context_dup, opt_hostname does not need to be processed,
>>> since this variable is
>>> essentially temporary. Immediately after parsing with the parameter, its
>>> value goes to
>>> server_hostname and it is no longer needed by itself.
>>>
>>>> Thanks,
>>>>
>>>>>       char *UNC;
>>>>>       char *nodename;
>>>>>       char workstation_name[CIFS_MAX_WORKSTATION_LEN];
>>>>>
>>>>> base-commit: bec6f00f120ea68ba584def5b7416287e7dd29a7
>>>>> --
>>>>> 2.42.2
>>>>>
>>>
>>> Apologies for the overly long subject line and unclear description.
>>> Thanks.
>>>
>>
>>
>> --
>> Thanks,
>>
>> Steve
> 
> 
> 


