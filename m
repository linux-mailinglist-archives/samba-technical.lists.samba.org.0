Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BD0373F2
	for <lists+samba-technical@lfdr.de>; Thu,  6 Jun 2019 14:16:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=3lzOGi93zeAumR4B4KWzFuZe/wrbU+hpa3dRX/OL9Qc=; b=BIQRlMO19kd7EVcE8YIWQZ0BT/
	H/2JKb0eo9ZZSVqjlvYCeC+KVK++MebLawcP3eD9RxIMTU3a4ClpwM8UJzrFvzLvXxvG6Mi3tl3Im
	9DBcCpM7b5FzRw4Mk8gGCkrPfpUjAtgg1w8pxUHO3Y5r3k3cn/UpRC32b1AIICUXZ+IyBoaY+6i51
	YgwOvBfpzXb1JDtTp/4aoByS/5E7eVMtsx0az4z1lbPCvjYFuzXcUYx6CsxKTsyJQfJa1T5eNdXHO
	RsKFQsAtzkJ5FeHEtrqoTnVz+5ry7tIeIXmD0HCw8xDSVBrC9d+ObsMTOqAuB3fK1WyaLAi4om9m6
	LzOXIqpw==;
Received: from localhost ([::1]:62256 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hYrJM-000EZC-At; Thu, 06 Jun 2019 12:16:04 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:36124) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1hYrJH-000EZ5-Fp
 for samba-technical@lists.samba.org; Thu, 06 Jun 2019 12:16:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42627210; h=Date:To:From:Message-ID:CC;
 bh=3lzOGi93zeAumR4B4KWzFuZe/wrbU+hpa3dRX/OL9Qc=; b=LqI5iE1nezTGfx+nD8DMvR1hka
 cSAPcDMQVgbhjXigamfTRxRrJEafZQDGk2JZ18S5EgKOEoIoNDKpaGIgS8XRGt4XD5pooRKooAjeu
 YEESEd6CnlK+B/hnHjhgaLxSHEQ/XVFmRWti2O2E3DgaI0rxoCEYs0hktRJOt98nH/tA=;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1hYrJH-0006jC-1i; Thu, 06 Jun 2019 12:15:59 +0000
Message-ID: <f62e5f179e28759f4d27be5ad65dfadc41eb59a5.camel@samba.org>
Subject: Re: Test failure in 4.10.4+Debian sid?
To: =?UTF-8?Q?Ond=C5=99ej_Kuzn=C3=ADk?= <ondra@mistotebe.net>, 
 samba-technical@lists.samba.org
Date: Thu, 06 Jun 2019 14:15:57 +0200
In-Reply-To: <20190606113908.dzmuky72fyqk52y7@mistotebe.net>
References: <20190606113908.dzmuky72fyqk52y7@mistotebe.net>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2019-06-06 at 13:39 +0200, Ondřej Kuzník via samba-technical
wrote:
> 
> Are the two tests known to fail (on Debian)? Am I doing something
> wrong
> above? Is there more information I should provide that might be
> helpful?

What is the filesystem?  Some tests are very sensitive to the
underlying FS, eg requiring pure ext4 and not unionfs etc.

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



