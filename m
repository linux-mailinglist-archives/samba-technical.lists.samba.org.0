Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66612143958
	for <lists+samba-technical@lfdr.de>; Tue, 21 Jan 2020 10:19:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=XWoGU9YSUMueOueNtZ/FYPnBfHZdgJXiGKWZCV/sVU0=; b=R+eTcQbsz3zPLbrSk13zfZFDS8
	omPsIgoxvUh4CLv1h8Tm7/UOIbDIegmeYW+T4KDUXeWr7j9REcsbmpEtHe1Pdt+5uoqf5+dzQim1I
	sLuefGxjcgnOXGnwfp/YyECSMOTs8DqWsnQBQeTiJNH93W858orzeM9lYAR5iwMsJ4mVWpEesS4bF
	F/9dx+tL+eP1bTxnYUOSz0WGch5IzvYaC8ey+EMVDgOLUhwVw8xSyYvl3WiNU9vJ4Gypwr11j58MN
	EN3sYXKh6+aPyg0zI+DdLDO4+zVoKnggUNHB21LmmY/D/wj4F3D9iddftCnlBDAhFv1IwoC0UNekX
	ItndcT0A==;
Received: from localhost ([::1]:48434 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1itpgY-003zVw-K7; Tue, 21 Jan 2020 09:18:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:38532) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itpgS-003zUx-Er
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:18:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-Id:Date:From:To:CC;
 bh=9DdJ1TC8t2t6OkRpalqfGbkeJDCPm/fLUXfMaFAWf5M=; b=nMJVwQsKe5A00Jer30Z0KQEuM5
 CDl9idoU+3JlNrRI8RFM1q02Bb17d54sxQnWPIINSyD4mhLB6d+POUbb8PN06Nnvc0p9eG1VBKSo9
 puoe1if5B7NMPGYIXSSyCbjajSoJ3uQIWAdHQ5GxfjwrxFW7XXK1OJ3xwTAf0f1FAtlORvrtTBEBC
 rFKSbPC8cszdhubVmusodvUoU3NMAm2k9kVpEcmj1tla2L1LdwlvZez1yLolPdDe8ZaJnJbJd72le
 W6CFhjXGhn4++uPA4Kr90PODYrDIoy9JTzGUm2q8XIjVk7zNQJ3iauODvMbiIZOpQVUohYhs14qED
 +H+UDJd/KzavMkMp5tLW2MUyqFtUvziC0uGa2S/vmpB6Ry2Kask+eqkWYhtGJETAatO3Ubnbutxg5
 kNClDJP8RfPOE+DIJA8sKSWwUKivvhZWOnkgjTWNxeIlHW9IHUqKkX4zeN6Pe6GrA6lJlB0VUVFYl
 IA3vzlwVj0o8qn304ueDstGW;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1itpgK-0007vj-Gc
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:18:44 +0000
Received: from localhost ([::1] helo=hr3.samba.org)
 by hr3.samba.org with esmtp (Exim 4.92)
 (envelope-from <github@samba.org>) id 1itpgK-00GEiZ-Dn
 for samba-technical@lists.samba.org; Tue, 21 Jan 2020 09:18:44 +0000
MIME-Version: 1.0
Subject: Re: [PR PATCH] [Closed]: Update gpo.py
To: samba-technical@lists.samba.org
In-Reply-To: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
References: <gh-mailinglist-notifications-7cbc67a5-3baa-45ba-be96-ccfa955fbabf-samba-123@samba.org>
Date: Tue, 21 Jan 2020 09:18:44 +0000
Message-Id: <E1itpgK-00GEiZ-Dn@hr3.samba.org>
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
ZXBvc2l0b3J5CgpVcGRhdGUgZ3BvLnB5Cmh0dHBzOi8vZ2l0aHViLmNvbS9zYW1iYS10ZWFtL3Nh
bWJhL3B1bGwvMTIzCkRlc2NyaXB0aW9uOiBUaGlzIGlmIHdpbGwgYWx3YXlzIGZhaWwgYmVjYXVz
ZSB0aGUgc3RyaW5nIGNhbid0IHN0YXJ0IHdpdGggXFxcXCBhbmQgLy8gYXQgdGhlIHNhbWUgdGlt
ZQo=
