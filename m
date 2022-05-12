Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 189805252F3
	for <lists+samba-technical@lfdr.de>; Thu, 12 May 2022 18:48:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=jGWNDQzN/FSeOEy9rio0grQL2PSMV392hCy6woL9DzI=; b=nHV/H+KZtC+e3mJDl5GK6v3j62
	Cm/1Q+O81SD6aLRMw4esckwccu1KBmdgD5GIksMA1oSehufWXxaQIXzjNZFxJlUGAz2QlXGr8L0ek
	qM9KDzA2ufICuQzeHYV89jzNFCJxoa03lFqqDZsyIIaX6R+Ra/Dm0CuD9dMkECsU6HvNrRrGUYMfX
	RI8SuNJzg/c+3sHIB11Arjz4Z3VPZkDKktcpdieteNb1NuL29FcZrGkUelyENZNursRyB7/7W02OE
	MkauqiGjl88OUQNvTdT5mie84oJBO1U5PSFIAymfXE4lGG/EkEHFpWTjvUgAZ0HESuEE3x1t7aSc5
	J+JOhTiw==;
Received: from ip6-localhost ([::1]:37006 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1npByG-0010d7-EM; Thu, 12 May 2022 16:47:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61560) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1npByC-0010cy-5G
 for samba-technical@lists.samba.org; Thu, 12 May 2022 16:47:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=jGWNDQzN/FSeOEy9rio0grQL2PSMV392hCy6woL9DzI=; b=0Vbyy7BaEeQLovg2Vrc0Sx1BV3
 EZxynRIGYF76mTKR96QRPMeM3kqyzABqXKu1g0EtoHEEDy2DEs7J/wUcff8n1i5Bdv+WIhjEH0mIq
 wShc8yi2rNm5h2lKbGODOv8V+ZHaXfnr2ngDDug3orGv6wG2Did/ggrIP9PA8UrQJ76hkyaepYAcD
 Mm/3hXFNf2Kcr+p/Yw7kIjcNqpzJ8rTFH75mPPZuRKWp52cd8EuchdaA49q3eqdqij3MQvW7dNbBT
 8LZKDF7o4oTP5/vySYDV7Il0a1s2YtE5Ca/MpVaL9pTcjt6K8H/IeJTUpWtAEBYXXcLbwBDghMaiw
 4LukCgezzXVOGzogiuG7+aNTVrAWOWmrAx6xTrur7aQ2vMwHErmG20qfOUIU0ZwC3ykaApVJoIYV3
 8m1nrXNv5yAHkndP6frxyV1F7WF2n9kU2HpUdSe0eigRxrm8eU6h8zbDMzb/oWMR5RF4NWryG/CUe
 9kNQkrKVaxMS3nOK7L/RTYX4;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1npByA-000XXX-Mi; Thu, 12 May 2022 16:47:19 +0000
Date: Thu, 12 May 2022 09:47:14 -0700
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Remove last bits of DCOM code?
Message-ID: <Yn06ErNlw/mCmJtt@jeremy-acer>
References: <b2e7c521b206ae21889e7409735dca2107e78e38.camel@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <b2e7c521b206ae21889e7409735dca2107e78e38.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 12, 2022 at 03:03:49PM +1200, Andrew Bartlett via samba-technical wrote:
>Bits of Samba that were implemented in the hope of doing DCOM cause us
>work, be it from users who dare to hope that there is a future for wmic
>in Samba, or from oss-fuzz when it finds inefficiency in our NDR
>parsing.
>
>It is just a dead weight on the project.
>
>Does anybody object if I remove it? (I will submit a MR if there are no
>objections)

No objections here, please go for it !

