Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 27BE613654E
	for <lists+samba-technical@lfdr.de>; Fri, 10 Jan 2020 03:25:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=EiZA1GV45CM0Bb5V5YbbuyOeY0Qv7hjBeTuVfSNCiu4=; b=i3RrXqtGLPhEoA4PbMP90aBjQJ
	QGBc7YvJ92Y8Ckl9dcDRpmFpk8gP5XZD2PqYU+w/NqJIjF8ZGuuMmJoGtpvfoKNs1tdUpKcG74Z+n
	3SBfZ/iMl9KSbJpgHhT559qQG8NwLnomlu5Nee/HcZgwV+zdZL9lYzGndZbJp7Wl8BO9q4ZJdve9W
	1tSOiiaV8ru/s2KwlK9NMWDJoXUbUxSSOLL0YBRBIxfHT1vcT0xdziL79IMBoe0YwrY+7kZpI1O0b
	evdibJcKhoMmUL1DMjvsd+vIBw97qP0gFsGSzOL2FiTYkIcJ25AvjJRBV3mGlIn3dhktFOUxTsSuf
	862r0eQw==;
Received: from localhost ([::1]:59270 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ipjz0-002t7J-8e; Fri, 10 Jan 2020 02:25:06 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:48634) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjyt-002t6s-VW
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:25:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=Oho24KJ5L7ljlZhet3HMJ7uEhwiSH5JHD66qBk6Gh5g=; b=HIP2O7fMxHd/yrBlLWh8b+EHoy
 ypZEvKsu+koFtZaFMeGsdZZdV4LgWlU8VLxj+0KjOxOz0rpz+6oq72IZqgD9T0TdtZiAFFcMOMTRT
 7gMFb+kR05cLgjwlnFZxIgWPTLQRrF6RmHmNkjwsCBtWehPqjDRdzZEBnKlgn5p4Yhh7OA4EngFbQ
 WzkPmqNj0AKgDgPyRQh+zOLvKW/efy914KaI7Vf1tdGh7w0AhWBLBsr1kIgzUKO056rv8pi6V28xK
 uqck5/zj/McfJnnB8Mj0cRgs1jbrKqS8TkdFKe4uDAmPBaXmylKPDXbeNIkvDLXrDhENLN5irYFY1
 WgW+p2XKuGPhQz7WVSn77hbLEqhi+WAKa/uK8yKshAop3WzUYqAD07/g4QSfAD7GkZ19QqbkpxIgn
 FKa37kuwUL+bzVScdmAQH3oqDWkt4u689xoWfWeM1HgIwJYLSY48F/B6Y3bI67PHyWicxEFzGAVy8
 R/WE1QVV/cQXjBoqnPGCqKq1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1ipjyo-00061h-Lz
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:24:54 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1ipjyo-00309T-GD
 for samba-technical@lists.samba.org; Fri, 10 Jan 2020 02:24:54 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: fix ldb-samba: require pid match for cached
 ldb
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-164@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-164@samba.org>
Date: Fri, 10 Jan 2020 02:24:54 +0000
Message-Id: <E1ipjyo-00309T-GD@hr3.samba.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
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
From: Github bot account via samba-technical <samba-technical@lists.samba.org>
Reply-To: samba-technical@lists.samba.org
Cc: github@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

VGhlcmUncyBhIGNsb3NlZCBwdWxsIHJlcXVlc3Qgb24gdGhlIFNhbWJhIFNhbWJhIEdpdGh1YiBy
ZXBvc2l0b3J5CgpmaXggbGRiLXNhbWJhOiByZXF1aXJlIHBpZCBtYXRjaCBmb3IgY2FjaGVkIGxk
YgpodHRwczovL2dpdGh1Yi5jb20vc2FtYmEtdGVhbS9zYW1iYS9wdWxsLzE2NApEZXNjcmlwdGlv
bjogQnVpbGQgZmFpbGluZyB3aXRoIHVua25vd24gZnVuY3Rpb24gZ2V0cGlkKCkgZXJyb3INCg0K
U2lnbmVkLW9mZi1ieTogRGF2aWQgTXVsZGVyIDxkbXVsZGVyQHN1c2UuY29tPgo=
