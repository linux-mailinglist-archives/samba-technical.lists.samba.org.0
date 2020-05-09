Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A71CC50C
	for <lists+samba-technical@lfdr.de>; Sun, 10 May 2020 00:59:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=LZ157opuVHlsb8HsjIPPguOlmwIU839QNLO2U2Eh4as=; b=gTk7itSjW1408USZiyyrBOZsya
	LmO3wdEwT23SI0af5ClTDCO3BqpCcrOaZXclMVjji3wkHDegUgFYkz273iFGzbwoEZUsRzOGH4zcN
	CXhi0xu0YrdTjjkxXeWoI9ONtUrTdDt7pyhx3YRIi9huNX2xijUhmiLGJnbdwjHv8ZUcaY1N7qtiQ
	GyrVPUYJDkc7VFG8RvGUww2R+mb8RmXQUq1zKnmrDFzYU7Z+e+8+HaxbwEyN2g2MOzMXMmVI43jXU
	gI69Ijd8jqiAjlgRxkFrAMR/pom2nYxAIlPo1WvaljAO33/5RUHkU15ZGa6wVTyd9/mE7KoU8kzjm
	LbUqEVwA==;
Received: from localhost ([::1]:24474 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jXYQE-003apa-NA; Sat, 09 May 2020 22:58:18 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:15792) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXYQA-003apT-G0
 for samba-technical@lists.samba.org; Sat, 09 May 2020 22:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=LZ157opuVHlsb8HsjIPPguOlmwIU839QNLO2U2Eh4as=; b=fzqlIZV99r/e5zv3MjL5AF+Z+C
 GxwGcmUQy3m6rJAhHG0V8Ix0yqheZYDLMUM0TB+bjf63ywn4CsqNbd7CHLpiIhpx/R/c5gjTV1k5B
 92HtDKMzy31nx5UUdVTasw7anpjjEoutBwHPwyT6mmf6cdwTLG+sbfBdwfHSylj3r6ADwwbLd5xUl
 REieMaRYuyDVqc7xRgOH/ZZS/fzYx0258ZWZYoPvEmA3eMRm0ULiA0d1YxZ/fQGq9A+2ZN74o5J+D
 vaar+PknKHYLsME0Z/bR0cj+gJamVniseyAeArGKvM7AyMl6P81d1MOMrFXgyurDio6QQORbHarcV
 yB49tH/D994k5sujykA46uxHpPPNbaXMKDWn4pqcb22nJqQiutaWZP+k3Usez+RtavruQFBCfNBaa
 loHuqStGCX0BnntMe+mw6LYTWmn/QF42f0f9LlV64cTdwVqHI79J5OCdXxEMdivrA3kL9d4Dk6ASU
 WmJJ1dIgLBPBJmrTLXP5d1d8;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jXYQ9-0004zQ-AJ; Sat, 09 May 2020 22:58:13 +0000
Date: Sun, 10 May 2020 00:58:11 +0200
To: Matt Taylor via samba-technical <samba-technical@lists.samba.org>
Subject: Re: [PATCH] trivial quota wscript error message spelling fix
Message-ID: <20200510005811.6350203d@samba.org>
In-Reply-To: <CALSyjX6H7DgbqJze_01MexNR=SQxozYvhtB9p6cJQicYFuyfUQ@mail.gmail.com>
References: <CALSyjX6H7DgbqJze_01MexNR=SQxozYvhtB9p6cJQicYFuyfUQ@mail.gmail.com>
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
Cc: Matt Taylor <liverbugg@rinux.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Fri, 8 May 2020 18:51:18 -0400, Matt Taylor via samba-technical wrote:

> Noticed this when looking at how other options were handled while
> working on the vfs_snapper configure patch.
> 
> Trivial fix in the quota configure failure message.
> 
> Signed-off-by: Matt Taylor <liverbugg@rinux.org>

Looks fine:
Reviewed-by: David Disseldorp <ddiss@samba.org>

Minor nit: it'd be nice if your patches were git formatted, i.e. with
your commit message and sign off in the patch header.

Cheers, David

