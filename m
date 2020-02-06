Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66B7C1549C8
	for <lists+samba-technical@lfdr.de>; Thu,  6 Feb 2020 17:56:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=yQLC+OQz3beijs4qYW3y3/vm3Wu6s6uc4Nqg+qV91WI=; b=uEwEJjmPAMEOU4n1X9WhSfMi7U
	/rLXEPh1Lo6GbqAMKmBAhGOn5trkaL+e8tMqRlWAw/KWRY3rykqEN4Z8S4sJ8IQgUqCAjMws1HeT4
	LdM1lsAiilpdOHfvLv6VWlGW/P4vyNIuSLFQPWZS+CfP42v+plNAFy0FnjwXPQUkg9J5Wj6viw7lS
	Rp3keC3wEm9+CTyJi7g1mUrFHU9wbL4Wzww3asRlJFY9Wi6+Xms++o58skOKW3z5zV3hP+f8FM0ln
	FCtow6sv4pB2dv2nQ9Fw4sSHJ+3GucEhaEl371Kji9cP+UqfAjtRvuE5aPHW4S09ZEn7JA2RcUNqS
	iOPW+yCw==;
Received: from localhost ([::1]:33996 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1izkRX-008V1M-7i; Thu, 06 Feb 2020 16:55:55 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33688) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izkRS-008V1B-E8; Thu, 06 Feb 2020 16:55:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=yQLC+OQz3beijs4qYW3y3/vm3Wu6s6uc4Nqg+qV91WI=; b=dmgrECIDPrH+08t/xF3EqRg7co
 ZZ5NbQiRzkoOmJ4JFS85D44xXDou7ngEiuqwKdnmd+/I8DB6iIzCAlEe0XpKPdxKdCnMTllThekU1
 surE1Te7WCTIUB7N9giFGgRfIAhHvmhbg/NFIGNQl1Th5VXcBR1XfhTJwrFny+uJMnDzqi4g3OG7h
 sboUYvC3WtZcmO9zFJzB4NnymnLo1N+ppmisBReK826eZb/86v6MD47/hOqv1ma3cMofacFzSMDNf
 s7Vcn3lPGpXZr+WAEJNXj9PwbRcM86e1RpKqEYTiejMYRW4DayBgHY/SVV+GyfAer7VOHjKiDQn13
 8pWy/Y33t5zVQmg8C8hnxhJSpspEaIb3uoVnCujLpYH4WRyauCdtZZxkpuOmRTx65EC74Z+71o1iG
 jQkYSI75VPkaLMUY2jSBKMfIrJ76e1r7eTj7fSqjgxIdXRDH1W4bO7ZlS+8se507yMZ6mxzMoiBmW
 k4YgDX7vsfKZaQy/fHn6bZGb;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1izkRR-0006wu-LE; Thu, 06 Feb 2020 16:55:49 +0000
Date: Thu, 6 Feb 2020 08:55:43 -0800
To: samba-technical@lists.samba.org, samba@lists.samba.org
Subject: Video of my FOSDEM Samba talk.
Message-ID: <20200206165543.GA214397@jra4>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: jra@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

For people who couldn't be there who might
be interested !

https://ftp.osuosl.org/pub/fosdem/2020/H.1308/whats_new_in_samba.webm
https://video.fosdem.org/2020/H.1308/whats_new_in_samba.mp4

Enjoy :-).

Jeremy.

