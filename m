Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::443:1])
	by mail.lfdr.de (Postfix) with ESMTPS id 14F7722962
	for <lists+samba-technical@lfdr.de>; Mon, 20 May 2019 01:19:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Mg9SLl1ddVMOF+jpeurFw+f+6wM/oijRHV2Ud/D1ESw=; b=CWSFd30UbyzISR5QQ5F3VStgIA
	0SiVGvz/Vd3/EnmjPDsITNu/pYZRd0BkzFrOhhpEt9o3l9QukLyubFYh4dERyUlNwZcCseE0QaBJU
	JP1ahmo9IFRBeaHQFK0mlklnaRZaDxvLyHywU4rbp0rkARlFN+JV2uwfav1ZvA58n6Vn6tor2JDwc
	9d45jculK+9v2iWlSxcrPAUbLynnC5Y2HfqsgXNK5iG+K12WQMzSD7wfEA0HEFOGtwF1jp6ja1Qv9
	JTBcsSsR8GqQEna8wYj9R+zA+KU8ydq1T1BIIPatt0wMIqqo0XuRfVatKwKifug6K4WHUaHApDZ+I
	Hx1D+aqQ==;
Received: from localhost ([::1]:64174 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hSV43-000adn-LM; Sun, 19 May 2019 23:17:59 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::147:1]:20772) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1hSV3z-000adg-H6
 for samba-technical@lists.samba.org; Sun, 19 May 2019 23:17:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Message-ID:Cc:To:From:Date;
 bh=Mg9SLl1ddVMOF+jpeurFw+f+6wM/oijRHV2Ud/D1ESw=; b=WRD5FVq89cR1YluhXy7yYDk/x1
 JZRD/81CvLWAvtf/R1uy5eyHH1Tca/ofuEAlSXj9yM+ZAROxZfcbq4tuWoS9u+WCwn/Po1cwzxbhY
 E63uJCFGEUgqCUlklfpK2xc8QJUwYw/tJQyBrIQuT2JQxDeBQhIQJd6jm2qxXm74JfGk=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hSV3y-0003Ye-GY; Sun, 19 May 2019 23:17:54 +0000
Date: Sun, 19 May 2019 16:17:49 -0700
To: Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: Re: Another set of fixes for returning -1 as bool
Message-ID: <20190519231749.GA8022@jeremy-acer>
References: <CADRDgG5yc5R5eQRDf=mpVOf-EJ1ALaUQY=Qed1TJf3QiRGYROg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CADRDgG5yc5R5eQRDf=mpVOf-EJ1ALaUQY=Qed1TJf3QiRGYROg@mail.gmail.com>
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
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Sat, May 18, 2019 at 07:40:09AM +0200, Rikard Falkeborn via samba-technical wrote:
> Returning -1 from a function with bool as return value type is usually not
> correct. This follows up on commit 749f1290ce6 (
> https://lists.samba.org/archive/samba-technical/2019-May/133542.html) and
> fixes the remaining issues of this kind spotted by cppcheck.
> 
> I'm pretty sure about the first three patches. The last one basically
> inverts the return values of the test (except in one error path), which
> means either it has never worked as intended, or I have really
> misunderstood tthings completely.

Pushed to master, thanks !

