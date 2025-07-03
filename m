Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5CCAF74D9
	for <lists+samba-technical@lfdr.de>; Thu,  3 Jul 2025 14:59:50 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=RijAPlftSl8caGsZM3+9vNMXJsZtu4unWCVzeTZzzwM=; b=185QtKQgLqp0ckt2w1ZFtqGibG
	cbSPBhna2gmj1SvXwN6cnbR2M6RrojQrmqqs5YdKjqv7vB/fa/s+F4d6LHRds6WHKkOd/mUnHZnEd
	L4jtPv1htOi8pdn2ffiL5uOzVh0gfnQV2ieIyyJ+vPpqUQyEIn0vP+5M9caOMoTX0PaqBLCb0QMpx
	dRX03Sd5a1pNSCyMNZM5d19kUtFGLh9gxsM1HfGGibSAO/pp/aw8puTkNQMkXEu6eeFkt/WTbFN7K
	ZOxfAc3vSAVJaKkl0YNhpE0EVtQD68BshTnlzpifYgKJoA3FANK9BBcvxYnBuGifiqn7BatBiMVrm
	rg/mOo/g==;
Received: from ip6-localhost ([::1]:32892 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uXJXU-00ATOi-3w; Thu, 03 Jul 2025 12:59:44 +0000
Received: from air.basealt.ru ([193.43.8.18]:42266) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uXJXM-00ATMI-G2
 for samba-technical@lists.samba.org; Thu, 03 Jul 2025 12:59:39 +0000
Received: from [10.64.129.108] (unknown [193.43.9.250])
 (Authenticated sender: alekseevamo)
 by air.basealt.ru (Postfix) with ESMTPSA id 86EA8233B3;
 Thu,  3 Jul 2025 15:59:32 +0300 (MSK)
Message-ID: <3d3160fd-e29d-495d-a02e-e28558cfec1a@altlinux.org>
Date: Thu, 3 Jul 2025 16:59:32 +0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] fs/smb/client/fs_context: Add hostname option for CIFS
 module to work with domain-based dfs resources with Kerberos authentication
To: Vitaly Chikunov <vt@altlinux.org>
References: <20250516152201.201385-1-alxvmr@altlinux.org>
 <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
Content-Language: en-US, ru
In-Reply-To: <43os6kphihnry2wggqykiwmusz@pony.office.basealt.ru>
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
Cc: sfrench@samba.org, linux-cifs@vger.kernel.org,
 Ivan Volchenko <ivolchenko86@gmail.com>, samba-technical@lists.samba.org,
 pc@manguebit.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 6/14/25 07:42, Vitaly Chikunov wrote:
> Maria,
>
> On Fri, May 16, 2025 at 07:22:01PM +0400, Maria Alexeeva wrote:
>> Paths to domain-based dfs resources are defined using the domain name
>> of the server in the format:
>> \\DOMAIN.NAME>\<dfsroot>\<path>
>>
>> The CIFS module, when requesting a TGS, uses the server name
>> (<DOMAIN.NAME>) it obtained from the UNC for the initial connection.
>> It then composes an SPN that does not match any entities
>> in the domain because it is the domain name itself.
> For a casual reader like me it's hard to understand (this abbreviation
> filled message) what it's all about. And why we can't just change system
> hostname for example.

This option is needed to transfer the real name of the server to which 
the connection is taking place,
when using the UNC path in the form of domain-based DFS. The system 
hostname has nothing to do with it.

> Also, the summary (subject) message is 180 character which is way above
> 75 characters suggested in submitting-patches.rst.
>
>> To eliminate this behavior, a hostname option is added, which is
>> the name of the server to connect to and is used in composing the SPN.
>> In the future this option will be used in the cifs-utils development.
>>
>> Suggested-by: Ivan Volchenko <ivolchenko86@gmail.com>
>> Signed-off-by: Maria Alexeeva <alxvmr@altlinux.org>
>> ---
>>   fs/smb/client/fs_context.c | 35 +++++++++++++++++++++++++++++------
>>   fs/smb/client/fs_context.h |  3 +++
>>   2 files changed, 32 insertions(+), 6 deletions(-)
>>
>> diff --git a/fs/smb/client/fs_context.c b/fs/smb/client/fs_context.c
>> index a634a34d4086..74de0a9de664 100644
>> --- a/fs/smb/client/fs_context.c
>> +++ b/fs/smb/client/fs_context.c
>> @@ -177,6 +177,7 @@ const struct fs_parameter_spec smb3_fs_parameters[] = {
>>   	fsparam_string("password2", Opt_pass2),
>>   	fsparam_string("ip", Opt_ip),
>>   	fsparam_string("addr", Opt_ip),
>> +	fsparam_string("hostname", Opt_hostname),
>>   	fsparam_string("domain", Opt_domain),
>>   	fsparam_string("dom", Opt_domain),
>>   	fsparam_string("srcaddr", Opt_srcaddr),
>> @@ -825,16 +826,23 @@ static int smb3_fs_context_validate(struct fs_context *fc)
>>   		return -ENOENT;
>>   	}
>>   
>> +	if (ctx->got_opt_hostname) {
>> +		kfree(ctx->server_hostname);
>> +		ctx->server_hostname = ctx->opt_hostname;
> I am not familiar with the smb codebase but are you sure this will not
> cause a race?

The race condition will not occur.
ctx->server_hostname is also used in smb3_parse_devname inside 
smb3_fs_context_parse_param.
smb3_fs_context_parse_param is called earlier than the updated 
smb3_fs_context_validate, which is called inside smb3_get_tree:

static const struct fs_context_operations smb3_fs_context_ops = {
  .free   = smb3_fs_context_free,
  .parse_param  = smb3_fs_context_parse_param,
  .parse_monolithic = smb3_fs_context_parse_monolithic,
  .get_tree  = smb3_get_tree,
  .reconfigure  = smb3_reconfigure,
};

>> +		pr_notice("changing server hostname to name provided in hostname= option\n");
>> +	}
>> +
>>   	if (!ctx->got_ip) {
>>   		int len;
>> -		const char *slash;
>>   
>> -		/* No ip= option specified? Try to get it from UNC */
>> -		/* Use the address part of the UNC. */
>> -		slash = strchr(&ctx->UNC[2], '\\');
>> -		len = slash - &ctx->UNC[2];
>> +		/*
>> +		 * No ip= option specified? Try to get it from server_hostname
>> +		 * Use the address part of the UNC parsed into server_hostname
>> +		 * or hostname= option if specified.
>> +		 */
>> +		len = strlen(ctx->server_hostname);
>>   		if (!cifs_convert_address((struct sockaddr *)&ctx->dstaddr,
>> -					  &ctx->UNC[2], len)) {
>> +					  ctx->server_hostname, len)) {
>>   			pr_err("Unable to determine destination address\n");
>>   			return -EHOSTUNREACH;
>>   		}
>> @@ -1518,6 +1526,21 @@ static int smb3_fs_context_parse_param(struct fs_context *fc,
>>   		}
>>   		ctx->got_ip = true;
>>   		break;
>> +	case Opt_hostname:
>> +		if (strnlen(param->string, CIFS_NI_MAXHOST) == CIFS_NI_MAXHOST) {
>> +			pr_warn("host name too long\n");
>> +			goto cifs_parse_mount_err;
>> +		}
>> +
>> +		kfree(ctx->opt_hostname);
>> +		ctx->opt_hostname = kstrdup(param->string, GFP_KERNEL);
>> +		if (ctx->opt_hostname == NULL) {
>> +			cifs_errorf(fc, "OOM when copying hostname string\n");
>> +			goto cifs_parse_mount_err;
>> +		}
>> +		cifs_dbg(FYI, "Host name set\n");
>> +		ctx->got_opt_hostname = true;
>> +		break;
>>   	case Opt_domain:
>>   		if (strnlen(param->string, CIFS_MAX_DOMAINNAME_LEN)
>>   				== CIFS_MAX_DOMAINNAME_LEN) {
>> diff --git a/fs/smb/client/fs_context.h b/fs/smb/client/fs_context.h
>> index 9e83302ce4b8..cf0478b1eff9 100644
>> --- a/fs/smb/client/fs_context.h
>> +++ b/fs/smb/client/fs_context.h
>> @@ -184,6 +184,7 @@ enum cifs_param {
>>   	Opt_pass,
>>   	Opt_pass2,
>>   	Opt_ip,
>> +	Opt_hostname,
>>   	Opt_domain,
>>   	Opt_srcaddr,
>>   	Opt_iocharset,
>> @@ -214,6 +215,7 @@ struct smb3_fs_context {
>>   	bool gid_specified;
>>   	bool sloppy;
>>   	bool got_ip;
>> +	bool got_opt_hostname;
>>   	bool got_version;
>>   	bool got_rsize;
>>   	bool got_wsize;
>> @@ -226,6 +228,7 @@ struct smb3_fs_context {
>>   	char *domainname;
>>   	char *source;
>>   	char *server_hostname;
>> +	char *opt_hostname;
> Perhaps, smb3_fs_context_dup and smb3_cleanup_fs_context_contents should
> be aware of these new fields too.

smb3_cleanup_fs_context_contents should be aware of these new fields too.

Clearing in smb3_cleanup_fs_context_contents is not necessary, because 
if opt_hostname != NULL,
then the pointer in server_hostname is replaced (it is pre-cleared by 
kfree), respectively, everything
will be cleared by itself with the current code.

In smb3_fs_context_dup, opt_hostname does not need to be processed, 
since this variable is
essentially temporary. Immediately after parsing with the parameter, its 
value goes to
server_hostname and it is no longer needed by itself.

> Thanks,
>
>>   	char *UNC;
>>   	char *nodename;
>>   	char workstation_name[CIFS_MAX_WORKSTATION_LEN];
>>
>> base-commit: bec6f00f120ea68ba584def5b7416287e7dd29a7
>> -- 
>> 2.42.2
>>

Apologies for the overly long subject line and unclear description.
Thanks.

