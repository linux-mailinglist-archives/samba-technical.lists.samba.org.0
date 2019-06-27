Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id CC1B458C77
	for <lists+samba-technical@lfdr.de>; Thu, 27 Jun 2019 23:09:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=3bq0O7rw6iuq1ax/Z10M257yLXkslxRwm42PExzNVHE=; b=lNBcysNTs9cuNiIhKOqBiwQSM1
	/0EY2ENTfhIHY1YdBCkm9HPrs2jCsERAJPHSvAbu74iF8INZeX2TuMQv2VvLZQ+vt5ppjq4bS7RL1
	DSg0wrpqaVDur350HboDItLM/9L9rbkk0dKRVujdeTDB/dQAiArWKbwMIlrKAGQPHHsL5XjnW9wrJ
	JIeTA3sO5pt4Oe+u2fKJ7CDlonSTlBftQe3QGq4K22L5gibKY7CBp0sfqTD2MSWApzos3mGyfemT/
	3hySNsXSXHq4IbjonvYyPRQoV7zwCu2WWqdGnnf8dAWIdCwmPXyIUwQlpKeM+YyRljG4fktbz15Bs
	PJJM7Qsg==;
Received: from localhost ([::1]:51464 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hgbdV-002EQG-Gw; Thu, 27 Jun 2019 21:08:53 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:61076) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgbdM-002EQ9-2H
 for samba-technical@lists.samba.org; Thu, 27 Jun 2019 21:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=3bq0O7rw6iuq1ax/Z10M257yLXkslxRwm42PExzNVHE=; b=UICjt7/M1IU8oKBqU4EQhyGhtX
 2cCMFd6oGIw0k92KHlv/rwEr7Z4qVDBwN8Kq36+y2VGZ/MCReSgF8NC07tT7lMclvfd8aRx++eRc+
 vBBCmcfbuBgNpUk1cNUkgEGb931FevuUbJKo2kIs+KzsmZFNv2i3qkXF50xTHTttqBJ0=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hgbdK-0001Tn-Nu; Thu, 27 Jun 2019 21:08:43 +0000
Date: Thu, 27 Jun 2019 14:08:40 -0700
To: Shyam Rathi <shyam.rathi@nutanix.com>
Subject: Re: [PATCH] s3:notifyd: Handle sigup in notifyd to reparse smb.conf
Message-ID: <20190627210840.GA24489@jeremy-ThinkPad-X1>
References: <E869C7C5-1589-4AA2-BFF2-BD27F1C52D8C@nutanix.com>
 <20190524000405.GJ244578@jra4>
 <38917416-A93A-4B3B-9F44-B1B2D4087C03@nutanix.com>
 <20190524024232.GA14980@jeremy-acer>
 <969492C8-F2E7-4814-AC58-9595F66A0330@nutanix.com>
 <20190626201546.GA3263@jeremy-ThinkPad-X1>
 <F7CF28D7-2446-470A-8694-1E1E3FBF03B4@nutanix.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <F7CF28D7-2446-470A-8694-1E1E3FBF03B4@nutanix.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 26, 2019 at 08:25:39PM +0000, Shyam Rathi via samba-technical wrote:
> Thank you Jeremy.

It's now in master. Log a bug if you need it back-ported !

Thanks for the help.

Jeremy.

