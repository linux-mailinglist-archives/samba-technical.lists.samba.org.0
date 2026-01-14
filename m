Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AA35D1CFD2
	for <lists+samba-technical@lfdr.de>; Wed, 14 Jan 2026 09:02:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=52GBmd3ZJZGCMq6mNUZ7AYVpJg1vJRmvqTvUGhVjPCE=; b=FC4380E+gefS87qmoTQdJdPpZD
	HO6Rc3m/Rpzs+2ri3HrZdA82WYSNeDb0OJHyFisIB+i3Eagx7cGLMi4WdLre6dF2snXBpf9U7UxoU
	u1JnluyDjP80akoAD5COi6ukbVcPC8tJgAWF7wIuS4Qaw5khJ/DWRdUkdPmogqCv4hgXz2Hc7Wm9W
	Tn3AQrEWR+6XIYAa0E4I507cTu0g+BRPHEgGzR3vSLaFvE/CRb58StQyeUSAh7wl80Jg6Oe1bUXH9
	YrKmpXtbAnPbtb1HPAeb+7I3WraJP7BrtGpQhULdy9Jx3AoHTOwRYTS1PGqS2rT7QToGOiWPytvpC
	xbkYKqMA==;
Received: from ip6-localhost ([::1]:31772 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1vfvpD-0005G9-3Y; Wed, 14 Jan 2026 08:01:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:37046) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vfvp9-0005Fz-6M; Wed, 14 Jan 2026 08:01:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=52GBmd3ZJZGCMq6mNUZ7AYVpJg1vJRmvqTvUGhVjPCE=; b=XFvv2GMPQwsu6BKrLMhzZyeQOv
 TeRd/QFNNSHNsVwGgZ50FIBk/1+o8OpQwUGIVSI4Wo3c8gkf3xj7bR3NX8/KhvKPPpo1BLZKHzoFI
 w7GbyXNsnxaROhwFjWbcr0QvBIK8wQGBqcyRXHcNG0zGMi3NhHQ+ohSrwGF8oNt1FgadUScsf5lIC
 IXGLFPzzGI3ka2CtrxB+QcXJa8NdcaeaIfAfn78EHqEiojO1pRxt1iiOSQm6EmBr+K6oPbscrxYAD
 MlEXMVb2ouMMxY7uZd45hlMdpnhQ0M20qCYN5/zETiFnYAE5sgMXj4bOi6Y8cbEPAMlZR/jQZpC7P
 br/6eQ3j1JWa2winCc/N8opml+Jbfgnp6F3SU7IYj1mhfzq9Z1ll0vXVLEymQhIxq3NdIy8vQTkh/
 DkFFcVRnU395EFxUhJVaRx6xKBYHv1HjBF4IdVynglcJAN7i6q5FjUn4UOqA2JWrhS2U4gwR2S8wu
 8KjyL+zf0NCsvPNSpX9eXx84;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1vfvp8-000000003LS-2FnF; Wed, 14 Jan 2026 08:01:50 +0000
Message-ID: <b3f3e906-1718-4719-abe6-7bb1858ad607@samba.org>
Date: Wed, 14 Jan 2026 09:01:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [SCM] Samba Shared Repository - branch master updated
To: samba-technical@lists.samba.org, samba-cvs@lists.samba.org
References: <E1vfhlN-00ALwd-Np@hrx0.samba.org>
Content-Language: en-US
In-Reply-To: <E1vfhlN-00ALwd-Np@hrx0.samba.org>
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
From: Stefan Metzmacher via samba-technical <samba-technical@lists.samba.org>
Reply-To: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

> - Log -----------------------------------------------------------------
> commit b2866ad88163ca1dd25a4d54c64f8d98dfa3a4ba
> Author: Andreas Schneider <asn@samba.org>
> Date:   Mon Jan 12 17:03:35 2026 +0100
> 
>      s3:libsmb: Rework check_negative_conn_cache()
>      
>      The name and results are confusing. Rename the function and use a bool that it
>      is easier to understand.
>      
>      Signed-off-by: Andreas Schneider <asn@samba.org>
>      Reviewed-by: Pavel Filipenský <pfilipensky@samba.org>
>      
>      Autobuild-User(master): Andreas Schneider <asn@cryptomilk.org>
>      Autobuild-Date(master): Tue Jan 13 17:00:06 UTC 2026 on atb-devel-224
> 
> -----------------------------------------------------------------------
> 
> Summary of changes:
>   source3/include/proto.h        |  2 +-
>   source3/libads/kerberos.c      |  4 ++--
>   source3/libads/ldap.c          | 16 ++++++++++------
>   source3/libsmb/conncache.c     | 36 ++++++++++++++++++++++++++----------
>   source3/libsmb/namequery.c     | 24 ++++++++++++++++--------
>   source3/libsmb/namequery_dc.c  |  5 +++--
>   source3/winbindd/winbindd_cm.c | 15 +++++++++------
>   7 files changed, 67 insertions(+), 35 deletions(-)
> 
> 
> Changeset truncated at 500 lines:
> 
> diff --git a/source3/include/proto.h b/source3/include/proto.h
> index 854945e8db7..8847c3f4617 100644
> --- a/source3/include/proto.h
> +++ b/source3/include/proto.h
> @@ -576,7 +576,7 @@ unsigned wins_srv_count_tag(const char *tag);
>   
>   /* The following definitions come from libsmb/conncache.c  */
>   
> -NTSTATUS check_negative_conn_cache( const char *domain, const char *server);
> +bool has_negative_conn_cache_entry( const char *domain, const char *server);
>   void add_failed_connection_entry(const char *domain, const char *server, NTSTATUS result) ;
>   void flush_negative_conn_cache_for_domain(const char *domain);
>   
> diff --git a/source3/libads/kerberos.c b/source3/libads/kerberos.c
> index 5593364c397..ed8d52f7866 100644
> --- a/source3/libads/kerberos.c
> +++ b/source3/libads/kerberos.c
> @@ -1259,10 +1259,10 @@ static char *get_kdc_ip_string(char *mem_ctx,
>   		cldap_reply = &responses[i]->data.nt5_ex;
>   
>   		if (cldap_reply->pdc_dns_name != NULL) {
> -			status = check_negative_conn_cache(
> +			bool has_entry = has_negative_conn_cache_entry(
>   				realm,
>   				cldap_reply->pdc_dns_name);
> -			if (!NT_STATUS_IS_OK(status)) {
> +			if (has_entry) {
>   				/* propagate blacklisting from name to ip */
>   				add_failed_connection_entry(realm, addr, status);
>   				continue;

This looks strange, what is 'status' at this point?
It used to be the status stored in the name based record.

I'm wondering about the motivation about this patch,
my first reaction was: this is not simpler now.

metze

