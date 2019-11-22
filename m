Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 771CA1077CF
	for <lists+samba-technical@lfdr.de>; Fri, 22 Nov 2019 20:08:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=Twmmd7CtgRqbOVF4ft0+xM8F+utlqfXFP0Kpmo+DHg8=; b=S/3U1TTOsTU1YvhV1OrJfNk9DC
	HVOadSgo2hJgoFtjRKle+YhSbQlhX53UUi+QIZ1KLiCzwiCCk/1fPpajecRz/YwvcPvADIVULsCjV
	yr3Zh8iJ7pHtKnIs1lL4PNiYoAIKbAeiOWWZ/124q5y5N4uMRYLy753lfRL1jcg6OnoEamYRSRo2z
	hA4KmLYwy+b2uC8HL9WJyBeOSoWHlrnvdTujck3UkyhAZF/NgmQ9a947G0hfyQEsfRUqGGlJF4+Eq
	T3YHqcc20aRo52xMPzLQCd4Y11bJIWV4QnWimNu//b3gbS1uCccki+axo2Wv4uJHyHP7VPNwiAT95
	FRoFRH7A==;
Received: from localhost ([::1]:55484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iYEII-0028uM-KX; Fri, 22 Nov 2019 19:08:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:18756) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYEIE-0028uF-3s
 for samba-technical@lists.samba.org; Fri, 22 Nov 2019 19:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=Twmmd7CtgRqbOVF4ft0+xM8F+utlqfXFP0Kpmo+DHg8=; b=a+biJwL7wl38ONkjenvdYorG62
 ia8vBRl1/Dg0AkXx6xHrZBaPNtpewG7GbrOPsNt2hX4F3xEgLN1n95kXEGO6LDMpTUwDoc6sAqBEo
 ZCcrwwfhxBS2Ank/ndKgZ/rIwxJA8Wb2qKrFaP3ZhWMo/WeQhECeV8vGChlm3PTnqX5hoLS03sAah
 ctuALXgvpDYi7POLVxm3adYNhZ6yBW6g0jYfy2FYLp95Az6a7M5WlCygPcKViC4OvRSF6uK7UkltC
 g2ILQElXSvPtZYLn4g8NEaaohrt3SMOD2rGH3UDVtLz0oaVH9TOA4LfPj8p7W11fkh2FIRQKrRsBN
 WTpBPizYbQw1nl/FnFPzShbNLTln0N94qDwFPeXNw3wzVjyTgEPas7YFSi1cuQ024rKqlxUh9cYfb
 y+NayrebieYcu7JYL/09ApIlNjJ2xG76ZMYB7MNNx4ztuGSis2btY40S1oCab0nGlBjx/IF0PtnLK
 WnETRWHh1/k2Lildymy4Ve8h;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iYEIC-0007bj-3o; Fri, 22 Nov 2019 19:08:32 +0000
Message-ID: <67329ddb56bab6d6091afa089ccbcb95bcdd66ea.camel@samba.org>
Subject: Re: [Release Planning 4.9] Another 4.9 bug fix release
To: Karolin Seeger <kseeger@samba.org>, samba-technical
 <samba-technical@lists.samba.org>
Date: Sat, 23 Nov 2019 08:08:26 +1300
In-Reply-To: <b809fe9d-b399-c13a-bdc5-0680d140ca6e@samba.org>
References: <b809fe9d-b399-c13a-bdc5-0680d140ca6e@samba.org>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, 2019-11-20 at 12:16 +0100, Karolin Seeger via samba-technical
wrote:
> Hi,
> 
> due to
> 
> Bug 14175 - Incoming queue can be orphaned causing communication
> breakdown
> 
> there will be an additional 4.9 bug fix release asap.
> 
> Are there any other important issues that should be addressed?

I'm swamped, but this looks important and Denis suggests it would be an
easy fix (just more hard links):

LMDB domaindns/forestdns partition corruption with bind9_dlz

https://bugzilla.samba.org/show_bug.cgi?id=14199

I certainly won't be offended if someone else fixes and backports it. 

Andrew Bartlett
-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




