Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id EDC0018DC5
	for <lists+samba-technical@lfdr.de>; Thu,  9 May 2019 18:14:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=buRHYvHLxR44jyPlj8b9xgEA8ElFNldl4L+Fl2jcoyM=; b=I1NjU3IgIQqDmbPLrMq1lO9sAJ
	ACMqoOzHF/7hw0YHj0FXotiVI/DNmFx6dNPsv+AkODRo4HmnA5IyXAQkrDjHtWmb15GYOCg2Hy4qT
	Z9ugiZH0w/7C4gUiOCaiUUONbyTFUNA1+YfCrwgjll7WRiVgjqhV9fMpp2o6wNS8zsQCM/5Chhi8P
	V70yuizy5Gmw4Bhqmre3XiADv/t8TIYHdz1xgthI8h+V097IichzAbF0ccp5kQ6Zz5NzTuSodHl+m
	2iiq+awbUbe30lrTBPxg/llw+TUOZaJP18WW/vvK/3psmzLRpNn/F10FBRhw+5ZeCHFY/3N3jTHNd
	zP5Ep0Tg==;
Received: from localhost ([::1]:49230 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hOlfu-0035XZ-K1; Thu, 09 May 2019 16:13:38 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:26706) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hOlfq-0035XS-Lv
 for samba-technical@lists.samba.org; Thu, 09 May 2019 16:13:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=buRHYvHLxR44jyPlj8b9xgEA8ElFNldl4L+Fl2jcoyM=; b=oAmzRUvE5Sl6thCA9Y6kClpUHf
 DjPXMs5XTEbVZsrTvYud+JkUz5U+gr7Gnr93o6lTTLfQjvPdLx/QKkkTaiB1MXIKthR/1Qj28uKqF
 ffgA99kTvbZWcr+buYCaRlMe+rzCaOzgqpBHtYi75kqee1js3kOt/K+oGGjo6EjNe4wc=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hOlfp-0001uE-Gs; Thu, 09 May 2019 16:13:33 +0000
Date: Thu, 9 May 2019 09:13:29 -0700
To: David Disseldorp <ddiss@samba.org>
Subject: Re: GSoC 2019: welcome Mairo Rufus
Message-ID: <20190509161329.GA205240@jra4>
References: <20190509131420.17d98c62@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190509131420.17d98c62@samba.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-BeenThere: samba-technical@lists.samba.org
X-Mailman-Version: 2.1.23
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
Cc: Samba Technical <samba-technical@lists.samba.org>,
 P Mairo <akoudanilo@gmail.com>,
 =?iso-8859-1?Q?Aur=E9lien?= Aptel <aaptel@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, May 09, 2019 at 01:14:20PM +0200, David Disseldorp via samba-technical wrote:
> Hi,
> 
> I'm very pleased to introduce Mairo Rufus, who joins us as a 2019
> Google Summer of Code student. Mairo is assigned the task of
> improving the smbcmp network capture diff utility[1], and will be
> mentored by Aurélien.
> Please make him feel welcome.
> 
> Cheers, David
> 
> 1. https://wiki.samba.org/index.php/SoC/Ideas#Improve_smbcmp.2C_the_capture_diff_tool

Welcome Mairo - Aurélien will be an awesome mentor ! Good luck.

Jeremy.

