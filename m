Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B1BF31287C
	for <lists+samba-technical@lfdr.de>; Mon,  8 Feb 2021 00:58:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=UXmLc3sVsZ51rCJNbGEhNVoto12q6PWPIOM3GG8+Up4=; b=VwajHc+dqv/+r9WkhLtjLdlaX3
	OyTqTVCAfL/7uP1WfGOp/rmk42U4vskq0DkZP7HqZBtKbZEDsHB8WPBNL6rhdV0qGk93qyx09aZnv
	ar3byYAiDW0gCNcEBdsZ78c8M+73IFb4eOJZgxKCDyaF4ycZcVNo511sCD0eLQVQEAq3ocnUmszMY
	I+r6OLotpkb0Zw9zLVuFS3DHXroxPN4MsOASVY4SD+jFdQOGduNNmhRGBsKinsrFuLNqK2lB9onHq
	GjT0G5NxZYNqvpz2V29hh5ZRCoUQVK1PXXT3y0KzUr+Hk8RGZC7fagGTNTgmKI+rAr2VqbErJ/djs
	q0Mt+3SQ==;
Received: from ip6-localhost ([::1]:27962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1l8twG-00BZLO-Vm; Sun, 07 Feb 2021 23:58:01 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:20008) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8twC-00BZKs-2F
 for samba-technical@lists.samba.org; Sun, 07 Feb 2021 23:57:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=UXmLc3sVsZ51rCJNbGEhNVoto12q6PWPIOM3GG8+Up4=; b=Crer5TC24q3IpU4i+EFWVoViLM
 fpGqrPEWakFkcxRJ8ajrkChj5adeY06Fr9/HKhwcnpDpUOlBG8CD49ZMiDqNXA1sTpmlO+wXMCrmd
 FLzEalhLbRN/0757wa5NepS3QTr56rWw5yujYoPgPU0TS39ab5FIeTnYhDCl7vzLjh09FacuFqmtC
 KxRvSAn6Wa9qOMyTNbMlLkhGcP51D6Qxxctx/BGbiiBrdphnUS5A+W8PTjFSpuLvJzoxIfXcr2bxJ
 jV4tHO07o+cph6XsLC4ohadFCDMfQBl22iH29DyFBlQjgKKbDpY9oFR6P5CLIZoLz4jAcNwGfWbS8
 15QfHgkxSU0HrrR3sIGGSM11+jjvtpWKpxoe4YoefjecfFxDn2cnRzoS8e9XayjzhgPxlGBwLq68P
 43TR3NIY7wZGhbTRlOz/2Caocx+BNN+YdlZKuYHqBOd+i/OeLhnO+KLBqjMnd5RNPz2q3zuKsg0pK
 DF2u5noFWfYBa153LDhOn9uu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1l8tw8-0004iV-LM; Sun, 07 Feb 2021 23:57:52 +0000
Date: Mon, 8 Feb 2021 00:57:50 +0100
To: Stefan Kania via samba-technical <samba-technical@lists.samba.org>
Subject: Re: Bug in Printerdriver upload 4.14rc1
Message-ID: <20210208005750.32e91aaa@samba.org>
In-Reply-To: <4bfe2e7f-65a7-e676-0701-01c84f0c0406@kania-online.de>
References: <14e9d56a-2e0f-6bcb-179f-d5f487f7bd2d@kania-online.de>
 <20210207004521.5e1076ed@samba.org>
 <4bfe2e7f-65a7-e676-0701-01c84f0c0406@kania-online.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
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
From: David Disseldorp via samba-technical <samba-technical@lists.samba.org>
Reply-To: David Disseldorp <ddiss@samba.org>
Cc: Stefan Kania <stefan@kania-online.de>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sun, 7 Feb 2021 12:54:56 +0100, Stefan Kania via samba-technical wrote:

> Hi David
> 
> Am 07.02.21 um 00:45 schrieb David Disseldorp:
> > Please raise a bugzilla.samba.org  
> 
> Done.
> https://bugzilla.samba.org/show_bug.cgi?id=14635
> 
> I will send the hand out to your mailaddress, because I don't want to
> put it in here or in the bugreport. It's showing all steps but not finished.

Thanks very much :)

Cheers, David

