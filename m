Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1078B1C537C
	for <lists+samba-technical@lfdr.de>; Tue,  5 May 2020 12:43:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=X16fMjJFXep5QzfJLtECbMxOCnkO2OyVVT3vR4zBg7A=; b=fIPenAaKNl7E1c8PQvFL2LS3L3
	ddcznKiIiCWMYdjouXybbcC9hjTyGv7tq9BD3OL7x5o8DlAof6fEy9BiBMmzv/TCrqJBSoDINn/le
	OnUTeYjiy42ygrtz2bS9xEvdgpT6xk0OHdLgeobOVoF+X2droovyzN/dIEdbDt9yjbjzErDi5L4Xg
	RhMzCSjVv/LZah9TMR8CpH5ax7rLvX+5rPnB9zhsKBx3jLjlna162/mKY/e4ZhRuSokrBZAZM9qvU
	D+fLqC+i60hH1ADIFqeQF8Gi3SVBxGQMno1wL9n8HZDy6dOI6cndWVMAJ1D9OBI1Ry8rMzkmmK3NR
	AUxrupUA==;
Received: from localhost ([::1]:19196 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jVv2u-002mI8-CV; Tue, 05 May 2020 10:43:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:40058) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVv2n-002mI0-QN
 for samba-technical@lists.samba.org; Tue, 05 May 2020 10:43:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=X16fMjJFXep5QzfJLtECbMxOCnkO2OyVVT3vR4zBg7A=; b=jZgDUjxv13nQL+FQHy8KqkIyzs
 UtU6b5ljpixMEdoZn0hhLDfJneDZiuiVpRmWbzVnPCTocRitcZGvD/bbrIR6rUweyPWzaosUbZuh1
 hzmk6jaLXhltxmXUHCrN3Tw3iTV5yIvr/fqxwo4kicL2K1OqTy+MZOes/Qfh5p93tVLocQf+76fBs
 4uUXlUAhfVHMwbm114hy44ckIL3sLY/MG07YjmxKeOxaovBgFkVGTsgNvlq/9BDaP20NGnWskBPpf
 p1r1wO9dxoE2OaJrYR0+O8wLnwZq6A8krI8GlWTU9Nqh5Hg4zuaiP7rbWgP7MerwRC7g++qsxk3eM
 IWKIdnQ7erJ3ZNEgP+6QnEerr9EZzDkg+QBI2d4qxLqu1c86dzE3WLBehXm7Gdz+OCmGtu0TOcWPs
 /You5EIufpNV9inG4BLPHj7whkP6aLVylMS23Z+43vS7yTGvqPI7jFYFifELd7DvVZpyMajCyTV0X
 x2o/CMdQzQx1qLarC0UKRjDt;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jVv2m-0001YV-VP; Tue, 05 May 2020 10:43:21 +0000
Date: Tue, 5 May 2020 13:43:19 +0300
To: hezekiah maina <hezekiahmaina3@gmail.com>
Subject: Re: GSoC 2020 Community Bonding Outline
Message-ID: <20200505104319.GB5779@onega.vda.li>
References: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH72RCX2B3z1Mv+R32yYA0GnpQY-WX7ustGtS3Npui1Dh_L+FQ@mail.gmail.com>
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On ti, 05 touko 2020, hezekiah maina via samba-technical wrote:
> Hello everyone, my name is Hezekiah. I have been selected to work with
> Samba during this year's GSoC. I'm excited to work with everyone in the
> community during the entire GSoC period and become an active committer
> after it's over. During the community bonding phase I'm hoping to engage
> with the community members, getting to know the history of Samba, how
> different people contribute, which projects the organisation works on and
> possibly contribute few patches before the coding phase begins. Any
> resources from the community aimed at onboarding new members would be
> greatly appreciated. Looking forward to working with you all.

Welcome Hezekiah, nice to see your interest.

please see https://wiki.samba.org/index.php/Developer_Documentation for
existing materials we have, especially around 'How to contribute'
section and 'Debugging / Testing'.

Since you are going to work on integrating Samba AD DC and Cockpit, your
work would benefit from the user documentation we have at
https://wiki.samba.org/index.php/User_Documentation, including how to
set up Samba as an Active Directory Domain Controller, since some of
those steps would need to be automated in your Cockpit app.


-- 
/ Alexander Bokovoy

