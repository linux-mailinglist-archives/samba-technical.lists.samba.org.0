Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E9DB13D748
	for <lists+samba-technical@lfdr.de>; Thu, 16 Jan 2020 10:59:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=yzeksaWrep10yy145jODAXSZGXGZUfUOk+Jbdy0izgE=; b=G1no/UlQbOnYqasUR70rXdOJ75
	Krrx56fKEkOf9AmG4Xx6ljpBHnRoLnYq5JODJLwOadaWkCs48+wxqIo1vs/yEMCG7O82p9QUPIXFh
	70kLe2lj69Fh9OcPhi8Zo5cUKYcyqEahhcEdkVuj94VsrY8AzSIORk8n1wmnSEnG9noAXoFnSQrnT
	w6BHmitSZ5+8bVu1neyomSNGxDQPtU5sZ19GpiRGdDMK1zUbuvbD9LeFjo4tXc+J+o80usGh1+WgA
	TPjWHZq2kRo9+FEsf+8SAeNicmB7B+nPZbiqEi6OqTJAYYv9byOLT9Kg7neAQvZifIrGhBHCOJasQ
	69kKQIyw==;
Received: from localhost ([::1]:23896 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1is1v8-003cDA-07; Thu, 16 Jan 2020 09:58:34 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:60836) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1is1v1-003cD3-Lv
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 09:58:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=yzeksaWrep10yy145jODAXSZGXGZUfUOk+Jbdy0izgE=; b=COQjiuH+Te8NSejTKFMN0g/v/2
 +xiatrR1+MnILouiPD6LIO1LyK2CvV3pOeXNTXLYbbKYS+/tUVAE4E3LCwLviP9kKnN4QyNzP9BL4
 yfFW9lINvzx2KtuAA42GTc1XW8s7iFEfhdEQyiNsA0PK2rrvezph/2hXYqRNMMlUUohsqVForgjlL
 bjfn905BT5CJx091gLUNv3Z7/4WD2bOhdnqRuX4BkIph9c2Y/TxS+RWMrrerY1wLnC+ik8ERW25Z5
 KLJ9da6cNbr8D/aD7VcdpRZRhbAc6uPsMptp0at2X4eW5E0IhvHhdwbAe+76mUzuwE0L+n54nTS7D
 rQbjA0zwk0cvVxAqLcegxtv+tpz5JuKaMzlsOiczYyoqC6/N2Wmw4uBCF58Z+rM3VbbAYTLJcFbVu
 HS5veBblKMxgSO4glhNF2x/aNkhl+InCti6Ya+oNmYdqcWQPkiNLzKo2NFOOtB+2KlxpxUIj6W/Nd
 Nk7jvAebi0jlyE2V5VJUKqcl;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1is1v1-0006nt-86
 for samba-technical@lists.samba.org; Thu, 16 Jan 2020 09:58:27 +0000
To: samba-technical@lists.samba.org
Subject: fuzzers
Date: Thu, 16 Jan 2020 10:58:24 +0100
Message-ID: <2546695.cijFyKqbAK@magrathea>
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

Hello,

thanks to all people who worked on fuzzing Samba. This is a great addition.

However before we add *more* fuzzers, it might be a good idea to first fix the 
bugs found by the fuzzers ;-)

I will try to look into it again the next days.


Thanks,


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



