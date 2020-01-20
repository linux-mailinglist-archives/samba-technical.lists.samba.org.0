Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C83A21433BD
	for <lists+samba-technical@lfdr.de>; Mon, 20 Jan 2020 23:12:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=EfNXPoEdqiK+9yZVMKeJHUTUT4NA81u4QtMfD59evV0=; b=jRuy1lZvuxSOca2zgYPxhzDP4o
	l+aBuZWSkC2YKOgKxlxWyE2FrLfOIFzNme4GDsQa/T9Qi0OUnOeciGYIfDGjhIU9ioH12Q7ktyuXD
	tEwfeuyfaHuC2F0cptUMu2GkAY5QtOX3hw7n62O1cD1mFTlisDotzrgPwuBNT1Ngs16SHAmR+OXd+
	WFoqJ6iqg6g3xIg8PNMpDaYmzD2zwIN+OPB7QLj+ssW3M3dQbiKOa6RwAXmj9J9683emPIr8yLD0k
	hIXI4NPFyhdLEzoLCvDl8ZIDPV260V5L1Zhc+yI80l+HO6XbIChiEM/xJcZd+oPqzvBfxFYHvzTSK
	tKx7CX2Q==;
Received: from localhost ([::1]:32356 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itfH9-003wcP-3C; Mon, 20 Jan 2020 22:12:03 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:32246) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itfH4-003wcI-8v
 for samba-technical@lists.samba.org; Mon, 20 Jan 2020 22:12:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=EfNXPoEdqiK+9yZVMKeJHUTUT4NA81u4QtMfD59evV0=; b=hIFP393hJqRsq6+eO9UEc7pKxe
 o4MKRVSsQ2sNUlnHLo5U+rHLKhlJdRBSmOYKaHWjIENyZvRPwo2VP7QLJC0EYe6Aw2z79FqO5b3Cs
 OTpzzZePUzp/0vdzWgLrAkEQvqHkqX2mmDSY5VJ6Nc4nOInNkCtsPusbirhbFRQ/VRHUzRVSZQKVw
 88MyYNiEvqWABrrt1Ur9w2OQkSqFC7TqRyer/AppV4j5Bb2PxzxcceUD/WQBRdn5ZGkkSekXWDCio
 j1Wo2+GyQOJe8b8VHI8iK6kf/Co/EEeFF+rCHL+HCvpJBBuJcSnVnSkuEl/fw9Ekm7h+KQ2Uj4Ta1
 AZ1b7VHRbVX217vHvSXgJHQCDc2fpLGnnBPF2ZE4yelAnnKr2V/3BX0ch8xmYoBLQIdXwRrTv0Oc9
 3RBKwCUuBHzTJZhd1hIfywF/c3uQKQz4LGCkQf4UXCxzqnb00bMtuwEhFvCZZZIf5NFm+XoV+QbbX
 QM9Lu0r1DVucplWMIkbixcJ/;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itfH2-00039N-5m; Mon, 20 Jan 2020 22:11:56 +0000
Message-ID: <b653187d77d8af54e240a006fd8467c8400a10de.camel@samba.org>
Subject: Re: fuzzers
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
Date: Tue, 21 Jan 2020 11:11:52 +1300
In-Reply-To: <2546695.cijFyKqbAK@magrathea>
References: <2546695.cijFyKqbAK@magrathea>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
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
From: Andrew Bartlett via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andrew Bartlett <abartlet@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, 2020-01-16 at 10:58 +0100, Andreas Schneider via samba-
technical wrote:
> Hello,
> 
> thanks to all people who worked on fuzzing Samba. This is a great addition.
> 
> However before we add *more* fuzzers, it might be a good idea to first fix the 
> bugs found by the fuzzers ;-)

> I will try to look into it again the next days.

Thanks, and I would encourage anyone else who is:
 - a member of the Samba Team
 - has a google account without a + in it
 - not on this list: https://github.com/google/oss-fuzz/blob/master/projects/samba/project.yaml

To join it. 

Andrew Bartlett
-- 
Andrew Bartlett                       http://samba.org/~abartlet/
Authentication Developer, Samba Team  http://samba.org
Samba Developer, Catalyst IT          http://catalyst.net.nz/services/samba



