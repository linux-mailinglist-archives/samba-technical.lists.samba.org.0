Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 50F57757B6
	for <lists+samba-technical@lfdr.de>; Thu, 25 Jul 2019 21:18:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=8Ao+niWXcYZm0AO2mtcFZudYn2AfP3l7Ts0uBFCDu+E=; b=XAdg0GbBpZirEU1lwkRPvI6yyU
	V8xlouTUm4vt1kNWLW/H7FK3YJKJNp7ADxXEvZh1P3yF1coRIxaVBcH1arNdOGTo95ltmSsnc8ewJ
	uLqVDEAdDuMauEwKtuPyJpcoDU1me6qLUq4JDaek2vzQNyfM5IlhC8QnmWKlSuVALedfpOU6QyJrg
	GVZ0ZCnqYgXuMc6Dd1cE4//0W54pHs3EyfjgGxuuwR3JBV0cei84jJnqth7gQed6KK7RiL+vQKu/o
	MBtGkF8hbdMLoJ0Oqi2S5YVn7rXbCy4Xb/G0BHd1d3hITuZTMENzyA7Y3W94xAwO0CkrZDTKK3HBu
	RciNkYEg==;
Received: from localhost ([::1]:21262 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hqjFy-000KQc-Gl; Thu, 25 Jul 2019 19:18:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:47180) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjFu-000KQV-A8
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 19:18:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:Message-ID:From:To:CC;
 bh=8Ao+niWXcYZm0AO2mtcFZudYn2AfP3l7Ts0uBFCDu+E=; b=omDgBRploZ5j3kE0GY3Ft9XRVD
 aE7EPfeKyvXuZ6lxiSIZau1wtNlZdUvORECXpds2bO2v+otlMFVQ+aL9jnnohidecg/n2b6C7KA6o
 OfD6Vc4e+WQYHpSKEDVlnmgEmT+xs9cA7rs6WWmOss2oReMUAfpIwUOhR9HYYYQiatqY=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hqjFs-0002do-Uf
 for samba-technical@lists.samba.org; Thu, 25 Jul 2019 19:18:21 +0000
Subject: Re: Turning off SMB1 make slashdot and theregister !
To: samba-technical@lists.samba.org
References: <20190710225121.GA142072@jra4>
 <CAN05THQ65himSVSYpzypUwDeJoaV6FPAhQpV4NEeCT3fRaBxFg@mail.gmail.com>
 <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
Message-ID: <4efb83c3-6df7-af2c-798d-b4ec681562ab@samba.org>
Date: Thu, 25 Jul 2019 20:18:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <dc0d693a2caf311097cf9a0ef8df3add01117ba7.camel@samba.org>
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

On 25/07/2019 19:59, Andrew Bartlett via samba-technical wrote:
> We can't do that until we provide a reasonable way for SMB1 clients to
> connect, probably via a SMB1 -> SMB2 proxy based on the NTVFS file
> server (where we had such a prototype until very recently).
>
> It won't be perfect SMB1, but needs to be enough for basic operation.
>
> I'm quite convinced Samba and SMB1 are critical infrastructure in many
> places and while we may dislike SMB1 for good reasons the alternative
> is to force such installations to rely on what will in 2 years be an
> unsupported and therefore soon an insecure version.
>
> I'm not comfortable with that as an outcome, so we need to provide them
> a way forward.
>
> Andrew Bartlett
>
Andrew, why do we need to keep anything like SMBv1 around in the long term ?

If you do an internet search, you will find blogs from Microsoft 
employees nearly begging people not to use SMBv1 and the fact that new 
Windows 10 installs have SMBv1 turned off by default, leads me to think 
that it wont be long before it is totally removed from windows.

If SMBv1 is removed from windows, then the major user base will 
disappear, so are you saying Samba should keep SMBv1 around just for 
Unix users ?

If you are considering the Network Browsing problem, then there are 
other ways to do this.

Rowland



