Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2048AE1072
	for <lists+samba-technical@lfdr.de>; Fri, 20 Jun 2025 02:41:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=iqMlKkYwE85hFkU/HBrA2oHnQcLd+xXP9TaFQ9akfgU=; b=VqgLtQWBfS+Gt+9kcN4js9KFMh
	q/YEvt6srTNEvVi7jAUvYOKTyWXwDZRaEzWvuT7Yz8+m0piO74/uLptsXtSsMVLewxjZttBasONtv
	rv79C5/IkgUA+bQ4lMC7OX9tkS/m+EyYFcRRENXR9nx055wxJeepZ9dUszuCCGq2cyRwKLkghQZ7q
	29XJMBDl35oFmxjTil6fw8ndD21tHT21/wuuWP2s8ClblpfqppQ24ElWgvdHzYQFCooRt+hlgR2LY
	jd4vwwsJdfUt9zpbx4wZRr+rHpniOKos4i8q6Egc+D9CwxsG/KsegPI0ukFf/XOaWbv2YBjS4FkTu
	TfajHYEg==;
Received: from ip6-localhost ([::1]:63594 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uSPoX-007TlN-Kn; Fri, 20 Jun 2025 00:41:05 +0000
Received: from cat-porwal-prod-mail11.catalyst.net.nz ([202.49.243.52]:60230) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uSPoQ-007TlG-Ty
 for samba-technical@lists.samba.org; Fri, 20 Jun 2025 00:41:02 +0000
Received: from [192.168.1.219] (unknown [114.23.142.188])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (Client did not present a certificate)
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail11.catalyst.net.nz (Postfix) with ESMTPSA id 03D78BA;
 Fri, 20 Jun 2025 12:21:27 +1200 (NZST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=catalyst.net.nz;
 s=default; t=1750378888;
 bh=DEIvpIAjVRdSagdlQAEplwqmxyNM6y8DVDqIIZbYk6k=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=sapr8kGMEL7Sb1m6QzeeroSAmKVVewsfiCTzS+/kFxoFtCc+fCVcsiG1IEWqHd9JH
 w69s9dKr9rV/mjIFLeBp2KM9xBOmZprG3XqGQGRJfYnczsuuk6Ga29AZFld4pe/2o6
 wRhcqrtJDojsai0beRjoiX5TBRQ7nNOhLCWPBZ5G5TUmNhMOJcP/wwbhASIbL6RmZT
 GWROv/ZIg82auvEfUTu+cR+KR56Ni+1PgvPV4nomrnIyzB85RZU7cDsdXwjgyCqWCX
 3Bx/VvUW1nZAzDlX8RSCUbfUp7rVj1uzsdZL4m2Npc4cOnpRa7ZtTu6wocHE8H+Ih2
 nuQwZCLMFMrFQ==
Message-ID: <2532598d-9525-4ca9-b37f-fb3582ea60ac@catalyst.net.nz>
Date: Fri, 20 Jun 2025 12:21:25 +1200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Seeing lots of coredumps from samba when using upstream cifs
To: David Howells <dhowells@redhat.com>, Jeremy Allison <jra@samba.org>,
 Steve French <sfrench@samba.org>, samba-technical@lists.samba.org
References: <869961.1750344431@warthog.procyon.org.uk>
 <882336.1750372293@warthog.procyon.org.uk>
Content-Language: en-NZ
In-Reply-To: <882336.1750372293@warthog.procyon.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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
Cc: linux-cifs@vger.kernel.org, paalcant@redhat.com
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 20/06/25 10:31 am, David Howells via samba-technical wrote:
> David Howells <dhowells@redhat.com> wrote:
> 
>> Hi Jeremy, Steve,
>>
>> I've been trying to investigate all the reconnection issues cifs is seeing in
>> the currently upstream kernel from running the generic/013 xfstest against it,
>> and I've realised Samba is coredumping a lot (attached is one example, at
>> lease several others look similar).
>>
>> The version of the Fedora Samba RPM I'm using is: samba-4.21.4-1.fc41.x86_64
> 
> The problem seems to be fixed in samba-4.22.2-1.fc42.x86_64.
> 

It looks a bit like

https://bugzilla.samba.org/show_bug.cgi?id=15803

which was fixed in 4.22 by patches for

https://bugzilla.samba.org/show_bug.cgi?id=15608

Douglas

