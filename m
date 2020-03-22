Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B81018EAFC
	for <lists+samba-technical@lfdr.de>; Sun, 22 Mar 2020 18:45:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=cV4ZsmBSuopv+75NjqIE85Zy5F6y71zj/rkd8vtIlMk=; b=MqnCvlMI1FmPzb5qIYVR62A97l
	LPRpqO/QDW3mtkZLWpAbOGD5+hckw+gjinScrbJoYXLVCBagYRN3zyvYBL6FBIiUCWzXnwal/jDgn
	4G+dFfMz9bxpRBgj7cdB7ZMo7TPgRWMNGFx0dw08jz8AfDLyecCAHoQnfBFCqlnTWInVnCtDVfWCA
	9HkBhYdVhHe5t/FvgyeT68Fq1Tln9Y0Sq+ALxbL5/9SvJi90Ah8rlYYdsuNiHMppOU0zFNK/RCGiW
	9kmR4hIdA0mHXPwZC4umrJuB5hGmKA1hvMBpQDlpfwwnCBTRbgRqaAIZPCWiWyAA9CemZgYPCH++q
	vcfiu01Q==;
Received: from localhost ([::1]:47164 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jG4fA-000RBk-RJ; Sun, 22 Mar 2020 17:45:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:51856) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jG4f5-000RBd-SD
 for samba-technical@lists.samba.org; Sun, 22 Mar 2020 17:45:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=cV4ZsmBSuopv+75NjqIE85Zy5F6y71zj/rkd8vtIlMk=; b=c4K0bc+Z1uelYf4T8rnJqOMO38
 9FOajswrzXtDKaER02kWolQZWO1qmI6DvwPA0ZY6iDH8sZGptZd6oKwWYCePosbzIwXB2jMQa50rl
 gml2tXzRIICgeW7yP5n4/AQmKEkospSMMmAAa9+QR/BZiyDTOwyIAOUClltA+gZM5HuHRl077HZ23
 bWK5lt7FjCMy/KCl6N3v+S6AcP4Hk3PsKcutKr2G6tglVNKZpGJQZjepcsdblyOUYkiDaKJQyb2Q3
 2BCb2bPsAjbbHVHGbU382Bvib6v6l3HYmcszxj4RZJSAA0XC6hB3+jTHUi+qaZHXTmSzOHzpLQe3e
 u5HIm81+ZMop1F4JmE7Cpf6eR1j5h2eh/KoDdO8l4ncvfxuYNDCZoMwmCkvie4hi6PYLLg0NIuLC9
 Cwhgw9k5g4orF4b75Ht3+TpRsiPJoxR0bkHDIQIQN4nN2pTxa4C/3yRKfrfndcQSqHGhu26kKHq2P
 X5qF/Ed+vNFIYi961M1MmMkc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1jG4f4-0006TF-Hk; Sun, 22 Mar 2020 17:45:23 +0000
Message-ID: <5c944d9e02acaca977b490498bdb403e8ba04114.camel@samba.org>
Subject: Re: GSOC 2020: Introduction and queries about the MS-PAR related
 project
To: Rajendra Prajapat <raj.code.pra@gmail.com>, 
 samba-technical@lists.samba.org
Date: Mon, 23 Mar 2020 06:45:18 +1300
In-Reply-To: <CAMO=cWeDUEKZYm5fDDgLhUpsagMcf_+mzmfBqaHDim4fU1W=ew@mail.gmail.com>
References: <CAMO=cWeDUEKZYm5fDDgLhUpsagMcf_+mzmfBqaHDim4fU1W=ew@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 2020-03-22 at 21:54 +0530, Rajendra Prajapat via samba-
technical wrote:
> Hello Everyone
> 
> This is Rajendra Prajapat, 3rd-year computer science student from
> IIIT-Dharwad, India. I am interested to work on the project idea
> "Print
> System Asynchronous Remote Protocol Wireshark Dissectors" during
> GSOC-2020.
> Last few days I was exploring MS-CIFS, MS-PAR and MS-RPRN protocols.
> I am
> good at C, C++ and python programming. I have prior knowledge of
> working
> with Wireshark.

That will be a big bonus.  

> I am not able to connect to IRC channel #samba-technical.

Don't worry, IRC is not very active these days.

> From the idea page, I got to know about the following tasks
> 
> - Write Wireshark dissectors for MS-PAR
> 
> - Improve existing smbtorture tests, Which demonstrate how the
> protocol
> works against a Windows server.
> 
> 
> Please let me know where to get started for MS-PAR protocol and are
> there
> any tasks, which we can do to improve the proposal before submitting
> it?
> 
> 
> The link for Günther and Andreas' SambaXP presentation
> is
> not working on the idea page. Can you please provide the new link of
> the
> Günther and Andreas' SambaXP presentation?

To be clear, I won't be your mentor, but I've found the slides and
fixed the link.

All the best preparing your submission!

Andrew Bartlett

-- 
Andrew Bartlett                       https://samba.org/~abartlet/
Authentication Developer, Samba Team  https://samba.org
Samba Developer, Catalyst IT          
https://catalyst.net.nz/services/samba




