Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B5C29AB8B29
	for <lists+samba-technical@lfdr.de>; Thu, 15 May 2025 17:44:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=EO7OVpIqLv7VXaT017CH/hVnvdEzrlXKDlS3jQebfEo=; b=DOvtUMFhIlOAv+9HtbVRGiZ7df
	05vT9K+8uc5zOhZrChxCjz+kyFb/8Hzk33kRWEA4MIE4sokRn/CSxk2jrPvX1dfVMKYLr3YkuMntr
	HW3hQWCilMQu2YAT/KEMkvrHknStMofea3ms3BZrLwijxfHOcjtsXEBN8j62ajGdz5Hvw58HbN/A2
	hT1jg80V6pFfr28mdFQ9sO3P4+IPv+LyMfSvN2wASTdXd0CvUR/iAYuD7AxNORVWtSXWZmqIAGqWH
	fwIP8qYXgByJPsny7tSiEvIrxVNISXZzfHjFDioJDTWraKYAo+WdiItyzTsOWqB054AaSdDUy4eEh
	zVoKg45g==;
Received: from ip6-localhost ([::1]:45612 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uFakx-003dIh-K2; Thu, 15 May 2025 15:44:23 +0000
Received: from relay4.ptmail.sapo.pt ([212.55.154.24]:48414) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uFakt-003dIY-9x
 for samba-technical@lists.samba.org; Thu, 15 May 2025 15:44:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sapo.pt;
 s=sapo20240325; t=1747323930;
 bh=EO7OVpIqLv7VXaT017CH/hVnvdEzrlXKDlS3jQebfEo=;
 h=From:To:References:In-Reply-To:Subject:Date:From;
 b=RaJFfjQ7Vk3au4BtEASL2nAv5CruQGyui7ETt3AUgcGQdI0NiBTqUdRE1bR04Wq01
 7gIN196tE4U+hS87FggamOWj9zkSMQ7DtsQLOvaZAdg3oUHBRafDRgDYyTL1KfJTKR
 7N03NfbFtMS7anBh7RIIOZQgXN0GvTTr2FegBbtFi87VORjx8QsjgsUz0GJ3FKggiX
 llJ6JJUfhcF/nW77DprOxDO+4x7anz7GDYQ/jSbVwEjGbB2qxYYg52aZ25FXfbZRkZ
 fZSMS2v1XNt4s4gLHNr3oTO+tJtsxVtuCuyDc1DromErLEJ/+3UR1DrNE1P3zMZiH3
 zmGug+4QdefHw==
Received: from sapo.pt (unknown [10.134.36.75])
 by relay4.ptmail.sapo.pt (Postfix) with ESMTP id 434FEB54BAA
 for <samba-technical@lists.samba.org>; Thu, 15 May 2025 16:45:30 +0100 (WEST)
Received: (qmail 463411 invoked from network); 15 May 2025 15:44:14 -0000
Received: from Sepher3 (unknown medalist@sapo.pt@[85.245.190.191])
 (envelope-sender <medalist@sapo.pt>)
 by ptmail-mta-auth01 (qmail-ptmail-1.0.0) with ESMTPSA;
 15 May 2025 15:44:14 -0000
X-PTMail-RemoteIP: 85.245.190.191
X-PTMail-AllowedSender-Action: 
X-PTMail-Service: default
To: <samba@lists.samba.org>,
	<samba-technical@lists.samba.org>
References: <00a801dbc59a$3f93d510$bebb7f30$@sapo.pt>
 <000101dbc59d$20eb9910$62c2cb30$@sapo.pt>
 <20250515155018.072004cb@devstation.samdom.example.com>
In-Reply-To: <20250515155018.072004cb@devstation.samdom.example.com>
Subject: RE: "netbios name" parameter
Date: Thu, 15 May 2025 16:44:06 +0100
Message-ID: <001401dbc5b0$3241a340$96c4e9c0$@sapo.pt>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 15.0
Content-Language: pt
Thread-Index: AQIvbtuLrozxWnzXqj7Ii0BjkuFicwJcprzCAiYhlnGzCGvh4A==
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
From: miguel medalha via samba-technical <samba-technical@lists.samba.org>
Reply-To: miguel medalha <medalist@sapo.pt>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

>>> With the obsolescence of NetBIOS, maybe it's time, for the sake of
>>> clarity and precision, to introduce a synonym like "short host
>>> name" to the
>> "netbios
>>> name" parameter, which would eventually be phased out in the future.
>> 
>>> As it is now, the "netbios name" parameter is the only way to refer
>>> to the short form of the host name, which doesn't seem to be very
>>> accurate nowadays...
>> 
>>> Lots of other Samba parameters have synonyms, so why not this one?
>> 
>> In the same manner, for the sake of consistency, maybe the "workgroup"
>> parameter could have a "domain name" synonym.

> But then it really should be 'NetBIOS domain name' or 'pre-windows 2000
> domain name.

I suppose you are right. Thank you for your clarifications.



