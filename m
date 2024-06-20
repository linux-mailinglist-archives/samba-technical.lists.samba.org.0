Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DFA91151D
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2024 23:49:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:To:Subject:Date:cc;
	bh=iGsIbvP9wUJrA+gK6+dqv0wXwaQSuhDcKjqgH75vrn8=; b=RRw1mt3aQhY3j0fFZBdMr1MspA
	QzLDhwy3HGEzKw3APY3ym1z/uIYHhK0tnS6bcjRpunNFXuE730cOD71Lphc/DW2fgrfYBTOYnV3NO
	47s+BN0Scaw9bqHm2lvf5aK7POr5J3qay2TwxIJO5dCVy5ULLEkDGXYCHarya0VoZ7IrCgKeoE39n
	fJm86NLmvIyKcXta9+LBEO9YWjUkNZwKl83X7AFNm2x18IvF8IC3Bj4yRiN1Vtd9mqtfLE/rmXuWM
	YsybjYdEKXTT7bqge710UgkAuNoOx1xSTxPWa6WcLf1GYSzHowcShaBO/YLc56bVqufkzju03QXVR
	lNRypqxA==;
Received: from ip6-localhost ([::1]:26268 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1sKPeG-00ElHt-1Y; Thu, 20 Jun 2024 21:48:52 +0000
Received: from cat-hlzsim-prod-mail1.catalyst.net.nz ([103.250.242.12]:37264) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1sKPeA-00ElHm-II
 for samba-technical@lists.samba.org; Thu, 20 Jun 2024 21:48:49 +0000
Received: from [192.168.192.96] (wlgwil-nat-office.catalyst.net.nz
 [202.78.240.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-hlzsim-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id 6C50B401DD; 
 Fri, 21 Jun 2024 09:48:39 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1718920119;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
 bh=iGsIbvP9wUJrA+gK6+dqv0wXwaQSuhDcKjqgH75vrn8=;
 b=oi8iTV8i4oz2KuJvqG8yZtjnu0MoIVO9niwj52aTHusuifTowrs0NpCV8xDzoo6rp0sxbL
 lNn2JendaxNy3mkPDcWTNQe2ESJLZoo3UtpdtaxkuY3oqt9CfAcBR+wojPouIGPxKf7HgO
 oBrim2GVWsZWq1I62uhK3GEIoRva1VIVxuaib3rReI/pxcQzue9+JWQT5PuhFMTAmxEc8b
 fy2ld2vMkis7487YcGKdKqmD8tKKje2QqdtSvd75SIsJL5O+1WXWTrjgA2h2762oAlfTXZ
 BVPS8RiEm2mLnhPjHUB+dgGmfDYP1O+E3RvCBCZOntMZC2KQHkGyyiW3Y0oczQ==
Message-ID: <0c94a659-e0df-483c-8efb-faaf907148f5@catalyst.net.nz>
Date: Fri, 21 Jun 2024 09:48:38 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: vendor version/revision string
To: Michael Tokarev <mjt@tls.msk.ru>,
 samba-technical <samba-technical@lists.samba.org>
References: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
Content-Language: en-US
In-Reply-To: <7bcfc541-aa5e-4663-a6e0-d21c2b3f3c33@tls.msk.ru>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-30.09 / 15.00];
 LOCAL_WHITELIST_IP(-30.00)[202.78.240.7];
 MIME_GOOD(-0.10)[text/plain]; XM_UA_NO_VERSION(0.01)[];
 MIME_TRACE(0.00)[0:+];
 DKIM_SIGNED(0.00)[catalyst.net.nz:s=default];
 GENERIC_REPUTATION(0.00)[-0.99999968009844]; ARC_NA(0.00)[];
 MID_RHS_MATCH_FROM(0.00)[]
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 20/06/24 18:46, Michael Tokarev via samba-technical wrote:

> So I tried to (ab-)use --vendor-name instead, - adding debian version 
> string right to
> this one (there's no need to have both options, one is definitely 
> enough).  And while
> at first it worked (for a simple version like 4.20.2+dfsg-1), it still 
> fails later during
> build process with a version string which contains a tilde, like 
> 4.20.2+dfsg-1~mjt-ubt24 -
> it fails at link time because linker script will contain tilde in a 
> symbol name:
> 
> SAMBA_4.20.2_UBUNTU_4.20.2_DFSG_1~MJT_UBT24_PRIVATE_SAMBA {
> ..
> }
> 
> The wafsamba thing is tough to deal with (it's probably the most uneasy 
> build system in
> the world).  I tried this change:
> 
> --- a/buildtools/wafsamba/samba_abi.py
> +++ b/buildtools/wafsamba/samba_abi.py
> @@ -288,3 +288,3 @@ def abi_build_vscript(task):
>   def VSCRIPT_MAP_PRIVATE(bld, libname, orig_vscript, version, 
> private_vscript):
> -    version = version.replace("-", "_").replace("+","_").upper()
> +    version = version.replace("-", 
> "_").replace("+","_").replace("~","_").upper()
>       t = bld.SAMBA_GENERATOR(private_vscript,
> @@ -317,3 +317,3 @@ def ABI_VSCRIPT(bld, libname, abi_directory, 
> version, vscript, abi_match=None, p
>       libname = libname.replace("-", "_").replace("+","_").upper()
> -    version = version.replace("-", "_").replace("+","_").upper()
> +    version = version.replace("-", 
> "_").replace("+","_").replace("~","_").upper()

OK, I'm thinking we just jump to --vendor-suffix and

       version = re.sub(r'\W', '_', version).upper()

for these.

> 
>  there's still a prob in manpages:
> 
> Samba 4.20.2-Debian-4.
> 
> Yes, it is cut at the first dot.

Did that not happen the old way, if you patch
SAMBA_VERSION_VENDOR_SUFFIX and such?

The missing bit is "20.2+dfsg-1~mjt-ubt24"?

Douglas


