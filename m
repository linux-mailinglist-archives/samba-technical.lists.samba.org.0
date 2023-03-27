Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3A96CADFA
	for <lists+samba-technical@lfdr.de>; Mon, 27 Mar 2023 20:55:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=o4kH5g//6xbso8rPkLtPw+KzMoXOtEQucBCK2rfL+ME=; b=HFO7M54IXF/hLkMSvqNpHHrDk0
	B6ihVTsC8s7jPRzShKMFiXTYqQLuRToFpewkpyOJH6u5h+CEG+ACHM7oyWe83QeX3PHtOKhbxIKs0
	Ugsbkm+XHvMOIh1CXBCUSLNEguqw1+z6ChQb9DbG8w2u8SH081pz04ACWVD1Q//BwzfxbuDre4qF7
	mVhpByRiUVWXyBoZzuLrBUu5vAFtBmRQRP3/xy4TefLGHvRXZHihmzeTNO3FgI5TcJLOiu4rtlFTZ
	rVCgiggW6LH/Xgp8UYdXCzVZiyhdsfhaqYhNHuLtIuT+VE4/mMuBE2os7i9vQx5LkcM/G4AH3/MNW
	3Eswy5jw==;
Received: from ip6-localhost ([::1]:63860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1pgrzA-004pWV-Se; Mon, 27 Mar 2023 18:54:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:63080) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1pgrz6-004pWM-E2
 for samba-technical@lists.samba.org; Mon, 27 Mar 2023 18:54:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=CihBsD9VgvCwI4+IyveKBC9zBoxmKY3SoB+NULXajsQ=; b=QTDlM5JePpa7ujpcG8HxTZamfY
 wrrLCbyxwBMLwqlTLjnx1YzklWqQp55krNWunAAgVX5Q+fn05mHJhvKeDcQgveU18VIvxGpixozCW
 SNzg0dQ4mgO/KjUuISuPF4AIU/HseEWyiY/L1qz5k1NuY9IG4ciwZyoasZSTZwDQ83Ssd7Ze8um+K
 F3kK35Q3pfMgXGdOTznAucV31DiI4djuRzS4cuWr4oaaci6OfXAM8J/tsJrGdrtuAqywaTkvsu9IC
 OSTBxL0P3bhRbrTuz7aT32d0IEctOj7nFuTcgyAOkmJ7DX6AxU20AlgtBi2tRTmmhptx+HwBVtvbl
 1s130UEfgYYTFYuB8uXVOF8GQXDj/DLfkDWCXkYTjBhbbEsmYafGkKYxr/k1X8Hnw7eOjF2PsMlJE
 EtzfNTS9HXX3fN4dXYXZQLiCLYcuqQXNBYwVN4rVmWjfjEhyUrnw2RZl3KOvFEf9aNlRlYycxtpVO
 jmuyPfMb5IcOaqvchSt+nicv;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1pgrz3-005hQQ-QG; Mon, 27 Mar 2023 18:54:22 +0000
Message-ID: <15d3b749822fd57ddbd07eca7a21119a2d83ba91.camel@samba.org>
Subject: Re: Joining a Windows DC to a Samba AD Domain
To: Ralph Boehme <slow@samba.org>, Stefan Metzmacher <metze@samba.org>
Date: Tue, 28 Mar 2023 07:54:15 +1300
In-Reply-To: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
References: <83053097-3abf-8fae-58e3-25c233049053@samba.org>
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Cc: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>,
 =?ISO-8859-1?Q?Bj=F6rn?= Jacke <bjacke@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, 2023-03-27 at 15:45 +0200, Ralph Boehme wrote:
> Hi folks!
>  From all I know it is generally not recommended to join Windows DCs
> to to a Samba AD domain, is it?
> I've just came across the following two pages on our wiki:
> <
> https://wiki.samba.org/index.php/Joining_a_Windows_Server_2008_/_2008_R2_DC_to_a_Samba_AD><https://wiki.samba.org/index.php/Joining_a_Windows_Server_2012_/_2012_R2_DC_to_a_Samba_AD
> >
> To avoid giving bad guidance I've added two prominent warnings at the
> top of the pages. Is this sensible? Is this correct? Thoughts?

It is meant to work, it just isn't typical.  Often used for migrations
out. 
The WMI requirement seems to have gone away.
Andrew Bartlett-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/Samba Team Member (since 2001) https://samba.orgSamba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba
Samba Development and Support, Catalyst.Net Limited
Catalyst.Net Ltd - a Catalyst IT group company - Expert Open SourceSolutions

