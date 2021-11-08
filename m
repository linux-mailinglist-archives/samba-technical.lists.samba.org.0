Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id ADA3144A55E
	for <lists+samba-technical@lfdr.de>; Tue,  9 Nov 2021 04:36:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=UOW2/aSbo3xiKg4elIvNPLdDntu3IoYBmR/BR4nYDEI=; b=0jZsV7WWc2A+RgFidFjxx/xddX
	6JQlcQkJ2kx6I5byeuPsH+frZ3gCE8upWKdW3/HVakYakYtPt07+1TFFg50jH7Hqme3mJBKl6SVB4
	uz8sVH9PDqeAoMwWjH4JIK/mIOdNwSciW17Q+P4h+hI51iakJBEronV9UtXC4fYBhyDMmUKkV0Puy
	9N/PMR65LTus4ap7YsseCMZDYaD3o8Pwvf0VNI7O/+Tb81uhQ5pdTr8JLKHchCINkBFdX34TgguEo
	4Eo4VtxMq8I94VmFXW93uFexe8uZfsYhTYStjAUdFJi9/MsEH9RGgeEoejpN/sBpBjGSw3ovLxUhV
	He885grg==;
Received: from localhost ([::1]:28458 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1mkHva-008uoM-OY; Tue, 09 Nov 2021 03:36:09 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:57706) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mkEB5-008sj5-UX; Mon, 08 Nov 2021 23:35:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:Cc:To;
 bh=UOW2/aSbo3xiKg4elIvNPLdDntu3IoYBmR/BR4nYDEI=; b=sEeZ449k4mqMPS1LfaCNAj8xnN
 jU6ZrL7gJtM2bSHaIn7Y2nP1pECxjXp3hb9jWxgQ1q3JURezYoLy69KBlTTTgizlu3tjcKBk33YZC
 yF1ZN3q5Xx/9Y1wYcCZxrOBqYOYMioWySTXjxt7/dmno03GyMGZe6NBRi2i2U3DWoKJMuyfrrNIeR
 WZLXzSgNHxosQRpNMzGlhrmYkRxCAmN+bot4i5c2JI/nBdkPXKJ3ptFf4RMTP9GAaYAmAo5XOuygP
 gF7sF003mMxOPc87m/e62Brn47cgIbnoCx/JPF3jqafjOjbeaLp6EG6XQ6GbtIGp/95Otfr3y3LjD
 snglB99zVA95FzNNcv3nm6KwRMnwff3Ox2qv6drvZKeVBOS4jMUtfe5G5LEHSd3uhZ+N3YICgwibc
 4Ek7mW23ofPSJim71D3T0rs9HPt1PFqPVLvonKKT7/MgTEsehM9p4UcxZFlQlRbQIcWldtSnzLVSf
 hkZ/NgdQXlP2AgXMBCyLNEGE;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1mkEB5-005raJ-2Q; Mon, 08 Nov 2021 23:35:51 +0000
To: Andrew Bartlett <abartlet@samba.org>, samba-announce@lists.samba.org
References: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
Subject: Re: Upcoming Samba security release
Message-ID: <199f0e15-291b-aebc-c2ed-8a429c9552c7@samba.org>
Date: Tue, 9 Nov 2021 00:35:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <654d3e50d01a29a8e67a3a188e2b3e10aa4f3f1b.camel@samba.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
Cc: samba@lists.samba.org, samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

the release will happen around 18:00 UTC November 9th.

metze

> this is a heads-up that there will be Samba security updates
> on Tuesday, November 9. Please make sure that your Samba servers
> will be updated immediately after the release!
> 
> Impacted components:
> 
> * AD DC (CVSS 8.8, high)
> * AD Domain member (CVSS 8.1, high)
> * File server (CVSS 4.8 medium)
> 
> Cheers,
> 
> Andrew Bartlett
> 


