Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 062FC27441D
	for <lists+samba-technical@lfdr.de>; Tue, 22 Sep 2020 16:23:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=xvhJ5zzEX/DEDER2TbLuPzbEnGMiA07/JMCDyN6PfHA=; b=FXvahoTVtRrryd/ywHtPsSJbq7
	sYNJhBUmm0930mnWKAFXFgMVUfv9aX0wK5UcEFDwPjoDcMkfeT18yQoIdOFr4+Jg4nqPh2bJpgkCO
	Kx4IL6zUniOPKng1gXBXCFmsDLE/G0Es74AMO2UwSFVPSU/od0CCjiemyeQwIqAC35yQBo+JEk8FO
	Fk0pxreualq6gGgV+N7G5DdsNK+J3FiNml+HxUkOxU3uZ90D7FUFKKPAbHqkvRNEcwJahxJGfI4/D
	05NA8TIbtRPT7hlkugxIC9zeoDCKQaccJWgTt3qVr/5V594O21bPR9RxkOv9D6GvbggrMrO58Op/F
	IxvqfRIw==;
Received: from localhost ([::1]:47562 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kKjCY-006hHn-GM; Tue, 22 Sep 2020 14:23:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:55752) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKjCT-006hHA-CC; Tue, 22 Sep 2020 14:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=xvhJ5zzEX/DEDER2TbLuPzbEnGMiA07/JMCDyN6PfHA=; b=PQvh7M+pYdfUfAwMG8dbN03Jw9
 RZ+q2cC3vYdq80GUh59zfaifs6zmB94rEA0fVw49Ob6D5MA95FjK7RrMF4EqBvrUYv2g/XhQVDRAI
 MiVNbDvR7+pUlqMMU1ap0hu0ZQU6qiv1FqZSonP2tE6gPMtyWoqN0ZQzDz9fmB7iCodmp5jFVhSka
 hYykt+focaYKmhMGCikg+II5f6xT8ywzrMqzLa+WFvHjcOCFxHNt8IAJmtfdQxTVwPWVC8xi4CAGO
 Nqbo7KRw7+AIS64zFQuHolHB+BXHaCmh7lhk8GcGevvoVkFVJPEPqDmKBJjtZxsS1lr/DC22KqIFW
 KQxPYEz52QzjzQ2S3M++wLiFIaPupZBRI/sAGjUX4Ygkm6LgKiJuDM63OETxwgX6qLytVIsrKoMlt
 4n1085xyuRa42kh/0KjH2nieR3BpERBRIcSOQL62DDW1v8cA1x8VRDs52eGhF9imtFxlGp8C5mVm+
 P9WtLDFdeXQo11yhul7YypZ8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kKjCS-00008F-Hh; Tue, 22 Sep 2020 14:23:20 +0000
Subject: Re: [Announce] Samba 4.13.0 Available for Download
To: kseeger@samba.org, samba-announce@lists.samba.org, samba@lists.samba.org, 
 samba-technical@lists.samba.org
References: <20200922140620.GA16336@carrie2>
Message-ID: <f1973153-cde8-dfb0-89b8-de189c0cc5e9@samba.org>
Date: Tue, 22 Sep 2020 15:23:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200922140620.GA16336@carrie2>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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
From: Rowland penny via samba-technical <samba-technical@lists.samba.org>
Reply-To: Rowland penny <rpenny@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 22/09/2020 15:06, Karolin Seeger via samba-technical wrote:
> Release Announcements
> ---------------------
>
> This is the first stable release of the Samba 4.13 release series.
> Please read the release notes carefully before upgrading.
>
>
> ZeroLogon
> =========
>
> Please avoid to set "server schannel = no" and "server schannel= auto" on all
> Samba domain controllers due to the wellknown ZeroLogon issue.
>
> For details please see
> https://www.samba.org/samba/security/CVE-2020-1472.html.
>
>
> REMOVED FEATURES
> ================
>
>
> The deprecated "server schannel" smb.conf option will very likely
> removed in the final 4.13.0 release.
>
>
> smb.conf changes
> ================
>
>    Parameter Name                      Description                Default
>    --------------                      -----------                -------
>
>    server schannel                     To be removed in 4.13.0
>    server require schannel:COMPUTER    Added

Is it possible to 'fix' the release notes ?

'server schannel' wasn't removed.

I can see confused users here.

Rowland



