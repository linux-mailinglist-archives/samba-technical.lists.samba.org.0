Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 791CE14218C
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 03:02:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=IWKJOhsJLuY717lW5KfjFEIK6M2xXGxYw3KH74/Wuco=; b=vueGz9zNRFVHQexpwm9axFDMW9
	cUrX41QYYzINM5JcFEIkwTo99lPLOKJ9gVlt9LE8UKF/KqFdAyqokmdurcchjLl/zKGAIHPNG4sLR
	9dWMTuEONWK/ykEsnzivRFAOJEpUJILGTPY96YqndvEZ/j28C3EDAZg2K6HaYfexjDGr8bscNFwo4
	lN0nLZA1En+84gBzJBuPo50F19vlwvI2oiJwOjmsyURRB3Ol0OaQmQCXKiXUrIvMaHimtWlzAqarQ
	Tx7FkR/dI933OOn3FFNeJ5c/1wWp51gAvnGymJiQAYHvXnPb3k0mymI4cVeraNrbccCwpM9tZGUgn
	uA7pPe1g==;
Received: from localhost ([::1]:59450 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itMNP-003sf7-R6; Mon, 20 Jan 2020 02:01:15 +0000
Received: from cat-porwal-prod-mail1.catalyst.net.nz ([202.78.240.226]:57404) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itMNC-003sez-41
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 02:01:11 +0000
Received: from [192.168.1.110] (unknown [114.23.142.188])
 (Authenticated sender: douglasb@catalyst.net.nz)
 by cat-porwal-prod-mail1.catalyst.net.nz (Postfix) with ESMTPSA id A594880F2F; 
 Mon, 20 Jan 2020 15:00:48 +1300 (NZDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=catalyst.net.nz;
 s=default; t=1579485649;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IWKJOhsJLuY717lW5KfjFEIK6M2xXGxYw3KH74/Wuco=;
 b=wvwmf0WU4hlEaSzgsFgfG90pL0YYvFuX4bgtWQ9V7GM5aw3JP8HB99TjpNClHo9TJGcxN5
 +K61pKD5fk9ROub73HpSg2T02mGELsEmWrGOzlN6oHXiOA546bhAZ03lmv2fFUjpO2YLiU
 6EFKN/Po/ukrvS+SAcSXOTI3/IcKp4T6mqlrCchpLY/1P/vTNgZrSMc23h6TXja2ugDnUq
 d7zbXYpoOqCAC3/RR2qZVhf0DRG/n+DwvP8nOAnhohrsBgGjbDNdF90/TwSJ61MjevR2j0
 ALlemIyyWdEOy0p5bGgCSCO33Mv2QIoj8OFz5xstkAn7ItLUUipYJBtRo9l16g==
Subject: Re: fuzzers
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <2546695.cijFyKqbAK@magrathea>
Message-ID: <0f82d428-6115-a26a-dfd1-02e79e573c8a@catalyst.net.nz>
Date: Mon, 20 Jan 2020 15:00:47 +1300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.0
MIME-Version: 1.0
In-Reply-To: <2546695.cijFyKqbAK@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Authentication-Results: ORIGINATING;
 auth=pass smtp.auth=douglasb@catalyst.net.nz
 smtp.mailfrom=douglas.bagnall@catalyst.net.nz
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
From: Douglas Bagnall via samba-technical <samba-technical@lists.samba.org>
Reply-To: Douglas Bagnall <douglas.bagnall@catalyst.net.nz>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On 16/01/20 10:58 pm, Andreas Schneider via samba-technical wrote:
> 
> However before we add *more* fuzzers, it might be a good idea to first fix the 
> bugs found by the fuzzers ;-)
> 

Should we adopt a convention similar to our BUG: links?
That is, add lines like this in our commits:

OSS-Fuzz: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=19395

Obviously this doesn't have the significance of BUG: in our release
process, but with our tools and discussions wandering out over more and
more systems, habitual cross-referencing seems sensible.

The oss-fuzz links will initially be private, automatically lapsing into
the public 30 days after the fix or 90 days after the discovery, whichever
comes first.

(Also, they ask that we add the words "credit to OSS-Fuzz").

Douglas

