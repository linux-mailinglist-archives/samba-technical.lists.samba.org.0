Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F601923D4
	for <lists+samba-technical@lfdr.de>; Wed, 25 Mar 2020 10:15:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=WPbmoFeFYe+LhoqWr5x8XtJJOhyXSmP8W/eyJ/Fc/lc=; b=yK23HLPfeFmjFyF/+GjO9hXflQ
	uE1ZzouIfC43Arv/bNoteB53r67+N89eOmU5jVqZETHF7rUOyZdbOT91vQ+SRO9T/N7R+KVLwvlNy
	cuFXyfKewrmG6ya49Jfb5YNbrp0N14TfiMMAZcOkpdV9zrjZPqKA+MvVyxierDKQPmrbDJ+kUM8G3
	KNbgnpOx9QAmVf3CgD9iwY4N6q5pa5/gmiV/mfhOiLwaLMS2ngTG+DPyNTh3lL4cI4VJFiuAZqOkm
	VvUDg7QFfPiGNiW/ldlgdVGadJShLsaH+FjGkZmwXNdac05fbRifpnq0+74GguKRnYBYsBfm4BvNA
	RzUs9WeA==;
Received: from localhost ([::1]:30588 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jH27m-000fY9-Th; Wed, 25 Mar 2020 09:14:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:43282) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jH27i-000fY2-1P
 for samba-technical@lists.samba.org; Wed, 25 Mar 2020 09:14:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=WPbmoFeFYe+LhoqWr5x8XtJJOhyXSmP8W/eyJ/Fc/lc=; b=vcfzdeVaFEpGcOVdLm13AVGjlo
 hGYdOcZWNWU8Z8N3hzMc8PExtn12hwndtp2ip6oAoi937JJjP6bAl/X3BtDVFxhzbqKuzhB7nak/I
 fjrNoYQG+9c6ZafjkfliW1hM3Q5Q+Uq5wxUVQcOdETGYHw1cwF0fYCDGcyRYuV/nQzY9/x8XZ056B
 vQidPrVBlhXvVZQeQQdTKCNZoK0E/knKIqU7fJZXsPSJ2jvBgMZJoj6mOZ8ZyJZKNLPQy7OjDEbAy
 c3ytMEOIJivYmeXdVd7HoOC8U46xOyDJna9frigCFIw/6C3YEHYNWMnmae6MurWUwIChIh+/QYNid
 pz4AzDwDaIWMXh1XOSE+aoDEqzTzsd0/JZeXbDREZLwuohuqGhg+Ti8K4fDaga3fjxj0PH/zLwtwj
 1xqcnpKmD1YyKQbe6pkCIoQGf84Pzs3j5VD1qaHkGLOs2htw6Zlxb7/sr1Yloo6d15I2LLqk1q74r
 nmXSbWgAdpzniAx+GMIw5vgu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jH27h-0006NZ-DY
 for samba-technical@lists.samba.org; Wed, 25 Mar 2020 09:14:53 +0000
To: samba-technical@lists.samba.org
Subject: We are ready for Sanitizers!
Date: Wed, 25 Mar 2020 10:14:48 +0100
Message-ID: <2428697.1TPDjVqDAD@magrathea>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

we updated all the wrappers from https://cwrap.org/ with the latest features 
and thus can run with AddressSanitizer, UndefindedSanitizer etc. now!

For at least AddressSanitzer you have to LD_PRELOAD=libasan.so, to disable 
deep binding of dlopen there are env vairables available like:

SOCKET_WRAPPER_DISABLE_DEEPBIND=1

We have a lot of work to do with UndefinedSanitzer ...



	Andreas


-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



