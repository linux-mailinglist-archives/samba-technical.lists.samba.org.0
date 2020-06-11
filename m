Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A6BF11F605C
	for <lists+samba-technical@lfdr.de>; Thu, 11 Jun 2020 05:12:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=7haNYj9kzYE65aWxqIl7v2F84RPyGh0B1D4dNdvETyU=; b=pkPaNFGhaEEpC4SrIcD8BNEh7Q
	Ni6AmbzFP9pswn3Ocl3f76jT+7WLt+EjiXIFyLTi7kUYPOc77XGhJ8FzkH5gLgApEfxJ7FKw0KGIg
	jwGTPLpCHRAgH/wCApzeNv0PrbdYDqyf040mRQNHxYYCrhCaCdS+Rol68/SvMarlYctaEs+iPVNz5
	7JeR9l2RxVC1+jGI6bfEoqlz8ZaBupmItmjeQcJp/AvOE/+ZxhQOBdSopo5AY61EIBEr2ukzOmbD1
	FvFtTm0Ksj137elKtM8h3J1KCHeRM+mjF8I5SYh78MRgQ6D5a0YD7DJxH3zpO1z6urDuhC1KumfAf
	2lTrTk1g==;
Received: from localhost ([::1]:27102 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jjDdB-0000lV-Oh; Thu, 11 Jun 2020 03:11:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:25008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jjDd6-0000lO-2t
 for samba-technical@lists.samba.org; Thu, 11 Jun 2020 03:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=7haNYj9kzYE65aWxqIl7v2F84RPyGh0B1D4dNdvETyU=; b=r8E8liRDwEnRCuAbGKYXC8pn+r
 jQ2EfZLdW9zUd41bf4fOOL3F+o0wMD4zMl/+KzTlFckQ5mdZoILuzoF5xUAp46Dfr1R3BBmooYsM8
 ASXHuUrOeTbebxNRmfmyn1i8OSfae3cAJTZc8Do1O53OPxMGcOXE7DWUgSpm1NOD5FU9I4sTDqyIe
 FtfDUkoBhwpl0OcFV2zIP+9XKR2Schteq/2q1/RkoMF+TBxvc1gZYFrbQ6UvUKbihCDnBjHdfQ/Cn
 ISsMKUSP5LF4C+ePSG/T76I7qVqSyEMvMdh1L3LowSrQek9clYpfrjw2NdU7O/FP4vZ97FyOXmlap
 klyfh0GrCZMIdUYz/2aan/8+u18yd1Ihnx97M6eHPQhnKg1wVHvCWysPNW0k4VZnS09M2Io87pJvX
 Rndy8G7zOflLoea+dxcO4NtUjBqHxTAwleFlfFkgciBu9A4eix1eDLXe9jfRtbPx1T+hMdg11sqEk
 NjtnxRf+0qqLN/fISWE9z0IL;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jjDd4-0001Js-On; Thu, 11 Jun 2020 03:11:47 +0000
Date: Wed, 10 Jun 2020 20:11:40 -0700
To: Rowland penny <rpenny@samba.org>
Subject: Re: [PATCH] samba-tool dns query --help
Message-ID: <20200611031140.GB9258@jeremy-acer>
References: <4ec26631-e80f-4507-e7c2-8dd7a130aae5@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ec26631-e80f-4507-e7c2-8dd7a130aae5@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, Jun 05, 2020 at 08:19:45AM +0100, Rowland penny via samba-technical wrote:
> Hi, whilst running 'samba-tool dns query --help' I noticed something, 'PTR'
> wasn't in the list of available record types, this patch just adds it.
> 

LGTM. RB+ and pushed. Thanks !


> From 00190a7281c7540481ea2e12279fd7da9885faa6 Mon Sep 17 00:00:00 2001
> From: Rowland Penny <rpenny@samba.org>
> Date: Fri, 5 Jun 2020 07:56:21 +0100
> Subject: [PATCH] samba-tool dns query --help: Someone forgot 'PTR'
>  from the list of record types
> 
> Signed-off-by: Rowland Penny <rpenny@samba.org>
> ---
>  python/samba/netcmd/dns.py | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/python/samba/netcmd/dns.py b/python/samba/netcmd/dns.py
> index 6faa54d1a8e..d4b06929aa3 100644
> --- a/python/samba/netcmd/dns.py
> +++ b/python/samba/netcmd/dns.py
> @@ -790,7 +790,8 @@ class cmd_zonedelete(Command):
>  class cmd_query(Command):
>      """Query a name."""
>  
> -    synopsis = '%prog <server> <zone> <name> <A|AAAA|CNAME|MX|NS|SOA|SRV|TXT|ALL> [options]'
> +    synopsis = ('%prog <server> <zone> <name> '
> +                '<A|AAAA|PTR|CNAME|MX|NS|SOA|SRV|TXT|ALL> [options]')
>  
>      takes_args = ['server', 'zone', 'name', 'rtype']
>  
> -- 
> 2.20.1
> 


