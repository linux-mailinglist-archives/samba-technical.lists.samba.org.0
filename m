Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BFB4930FC
	for <lists+samba-technical@lfdr.de>; Tue, 18 Jan 2022 23:45:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=3zVzd8hYKT3zsWzOt6lF6gWakNp/Fk139BBliRPW3Kw=; b=6bAIKQP0T18bhPwZ+OLTgcoUmr
	SUxfVNCY5bG1bPUKZz7w0yqHwsht5RHuPwiFgHq/yTZ3FoAuHzjCyTNOsM2bSeozT7jedMOz8fxSw
	xvAK3PNCg1WRbAl1glP8m/bZohk9HURnvEnKDeul5ps5VCZGBj0KBGmz//JhnrfE0U4+IqbMLQTYG
	pPG2W6kkr0kWWjQv+qbB9AOo5KxJRLN+0TggQ25SsJeg8TyTVFDCa6UJSfLZu+XU2JZjMFWvTYdYk
	iH/carqO4YjdlqfcbWfO0lMEap2njUlxNMozBJbnTDhKuDhoSLaxAb+uyISPTnhEWj98EaRP3re+g
	VIlmJGrw==;
Received: from ip6-localhost ([::1]:25540 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1n9xED-009gb8-Hw; Tue, 18 Jan 2022 22:45:25 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:40916) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1n9xE3-009gaz-NN
 for samba-technical@lists.samba.org; Tue, 18 Jan 2022 22:45:18 +0000
Received: by mail-yb1-xb30.google.com with SMTP id 23so1465654ybf.7
 for <samba-technical@lists.samba.org>; Tue, 18 Jan 2022 14:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3zVzd8hYKT3zsWzOt6lF6gWakNp/Fk139BBliRPW3Kw=;
 b=dqjE55k+zE/bKty/XlwHbc859LBeNKFcShQy2gKWecSD/mJiOhhmnRC05/WqtyiBQ/
 aGfTZvBOpuMBBXA+I3LKVUIP3gdNXYoXpvLdmgVbYYWHMoKvrjNQ72OK8XQivMNRUtst
 bB12Gz4kXyn1lN07dXd+DBS/rN+GA8cfFjehJcblwKqvLEd+/KehVqjqY6z3WPes7vmi
 IWh3Q5T5coBCqBte8v5Dgo7GYZ3Y/u7cHPvvQ944Ezqd7m/Kwkc9GPloHgTjzBagVky5
 KW/CWOnSU6tnnDW2EYKPeg30H8kbpPKaoRAm6wLS/gIZ77WHjl/h1UlR5/HQz7U2ICAx
 BpUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3zVzd8hYKT3zsWzOt6lF6gWakNp/Fk139BBliRPW3Kw=;
 b=a8XA0G6VLL2TuXk/9wo4I5ezh5PW+qiFrwl2M5bWdzEU4sDOVbHEwit3qg44WUjzbo
 uvSWIOkrRKhhI8wApfMKlZcGMhazp/vXIL319JIbBUfiwA+xpkn5aQ90alX4T0XkeR1c
 fXyVSiAUl4cMqwXTirrnNViJnhk7Wazz7/Zoh/Pn5nNjUNa9fmVGJXrhZMQEyZUFHfK2
 rUUVtoV64wT2F59N/oZu4avTGSkoELKrU4YZuqKqZSSAe8hXC8nvRM8Agp+osXUPlD7T
 LyNFFrS8aVUkQ1qBQDHP0HtGqvD37gqkKbk2J7cHIgb/apkoHtiv9sjv4FAnBzc4oZ4w
 kWow==
X-Gm-Message-State: AOAM531IWZNp0rQPeUD5RgQ9FFb8vN/9xohZhg6iaO07vdVhfc3fCKoJ
 OVY2OgaUs9U2lOMxOn1LweNruvPPxcoXeuocWPE=
X-Google-Smtp-Source: ABdhPJweMgO2xTgCPT+YiGAWMyne3hp/hAARqLDLslSk/68CSSVvqduh7ws90XpLiT3sZt6IP3eWDn62ekIKLvx8jjo=
X-Received: by 2002:a25:1e0b:: with SMTP id e11mr36255586ybe.272.1642545913530; 
 Tue, 18 Jan 2022 14:45:13 -0800 (PST)
MIME-Version: 1.0
References: <CAH2r5msv5w5oWVomujjwoC=PiNBu3b7kbQO6uJXVKbAwxGKuJw@mail.gmail.com>
In-Reply-To: <CAH2r5msv5w5oWVomujjwoC=PiNBu3b7kbQO6uJXVKbAwxGKuJw@mail.gmail.com>
Date: Wed, 19 Jan 2022 08:45:01 +1000
Message-ID: <CAN05THSRBhqs=YMGGhp1BSB-Qhm=7bQc83UcBDhrr6Qo36sZQQ@mail.gmail.com>
Subject: Re: [PATCH][SMB3] add new defines from protocol specification
To: Steve French <smfrench@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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
From: ronnie sahlberg via samba-technical <samba-technical@lists.samba.org>
Reply-To: ronnie sahlberg <ronniesahlberg@gmail.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

reviewed by me

On Wed, Jan 19, 2022 at 8:41 AM Steve French via samba-technical
<samba-technical@lists.samba.org> wrote:
>
> Trivial update to list of valid smb3 fsctls
>
> In the October updates to MS-SMB2 two additional FSCTLs
> were described.  Add the missing defines for these,
> as well as fix a typo in an earlier define.
>
> Signed-off-by: Steve French <stfrench@microsoft.com>
> ---
>  fs/smbfs_common/smb2pdu.h  | 2 +-
>  fs/smbfs_common/smbfsctl.h | 2 ++
>  2 files changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/fs/smbfs_common/smb2pdu.h b/fs/smbfs_common/smb2pdu.h
> index 7ccadcbe684b..38b8fc514860 100644
> --- a/fs/smbfs_common/smb2pdu.h
> +++ b/fs/smbfs_common/smb2pdu.h
> @@ -449,7 +449,7 @@ struct smb2_netname_neg_context {
>   */
>
>  /* Flags */
> -#define SMB2_ACCEPT_TRANSFORM_LEVEL_SECURITY 0x00000001
> +#define SMB2_ACCEPT_TRANSPORT_LEVEL_SECURITY 0x00000001
>
>  struct smb2_transport_capabilities_context {
>   __le16 ContextType; /* 6 */
> diff --git a/fs/smbfs_common/smbfsctl.h b/fs/smbfs_common/smbfsctl.h
> index 926f87cd6af0..d51939c43ad7 100644
> --- a/fs/smbfs_common/smbfsctl.h
> +++ b/fs/smbfs_common/smbfsctl.h
> @@ -95,8 +95,10 @@
>  #define FSCTL_SET_SHORT_NAME_BEHAVIOR 0x000901B4 /* BB add struct */
>  #define FSCTL_GET_INTEGRITY_INFORMATION 0x0009027C
>  #define FSCTL_GET_REFS_VOLUME_DATA   0x000902D8 /* See MS-FSCC 2.3.24 */
> +#define FSCTL_SET_INTEGRITY_INFORMATION_EXT 0x00090380
>  #define FSCTL_GET_RETRIEVAL_POINTERS_AND_REFCOUNT 0x000903d3
>  #define FSCTL_GET_RETRIEVAL_POINTER_COUNT 0x0009042b
> +#define FSCTL_REFS_STREAM_SNAPSHOT_MANAGEMENT 0x00090440
>  #define FSCTL_QUERY_ALLOCATED_RANGES 0x000940CF
>  #define FSCTL_SET_DEFECT_MANAGEMENT  0x00098134 /* BB add struct */
>  #define FSCTL_FILE_LEVEL_TRIM        0x00098208 /* BB add struct */
> --
>
> --
> Thanks,
>
> Steve
>

