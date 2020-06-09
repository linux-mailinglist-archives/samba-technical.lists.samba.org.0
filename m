Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 285601F4211
	for <lists+samba-technical@lfdr.de>; Tue,  9 Jun 2020 19:20:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=36Dd6LfT1DADQcBG8nD0L1M7NfrTT1sANqM9qEYTx88=; b=kHx/ByK+QoOycYWLGp6++T4J/b
	pP09GV4DNrORx9yHXDLN6ca1+H8FaAtgNVLH6yMfpQIOgQKzqrF6GrZ2aBg3rVMUhi+vdBOQ/yKJa
	niu8RexkhF74pMdofzQjCHh8v0fYtmBGaYdisHZlo8lM5zvUIj+OVry7JBD0EYzKbWlE3tSbmE7cZ
	OgkN351Jn/tZDsTatPwOoGxfuEWadzSQ3QgbsETcw+mI5KoXm2Nstsgapc4LZp90H6R1crk+hfy8Z
	3nuoIEWegSivEn2sQOVRHrSynPG5gtrWvAr024fMsnltwTi2JuRFelMbSYix+vrHsu0CJLqNG03A0
	1E3NTmAg==;
Received: from localhost ([::1]:50986 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1jihuo-009dao-32; Tue, 09 Jun 2020 17:19:58 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41662) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jihuk-009dah-5g
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 17:19:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=36Dd6LfT1DADQcBG8nD0L1M7NfrTT1sANqM9qEYTx88=; b=fmnaeQBqemV2S6Otall2oyq2V0
 t6c3TjVmcjpdgcy2JVmngRYzMrRl84zecnBqc/QlSI4PhQe/Xy3jgDUG4954C90jXguUXc7GfiDEG
 XhmyFbh3LBQ2AcBhZTn02NZtGCTwqlR2U/8rTNLTcTK2LRZVZKvfTljHyn/T1beJYRb3kJTBdAAzA
 yoY2doRaojAWdncqjM6DkCH7OvXTc+O4K7GON/g55bHWgTijRuu4/f1D91Rtv0lzZpLru8VelDJdD
 JhaEAREu3gZDsXukW1nIJVvxMZX3bH/7uu4wFbm6O0z1zSnRr9vtXEthrr7yuZUtOgIFern1tCnZE
 6i0svkp+iniV810/lkkqi41Pf9QV9aR4Vukj+UIgzJX9M4ORQB5kae9BoqVuPO7JUqbfC5mozUD1i
 BagPhTbFR52JJp/GRZkb9xVWYlPb0+CRVJpME8f6ibFDZJGwQKn9pAGItvJmp8N97kYIkg4ooRYoA
 PFKLaY+o+2PGFZp51xgl1HHx;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1jihuj-0005Wy-BY
 for samba-technical@lists.samba.org; Tue, 09 Jun 2020 17:19:53 +0000
To: samba-technical@lists.samba.org
Subject: Merge Request Template for Gitlab
Date: Tue, 09 Jun 2020 19:19:52 +0200
Message-ID: <3443591.AXIHuhjjAK@magrathea>
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

as I don't have any rights on gitlab repositories, could someone please setup 
the following Merge Request Template:

====== template ======
Add a description of the new feature/bug fix. Reference any relevant bugs.

## Checklist
 * [ ] Commits have `Signed-off-by:` with name/author being identical to the 
commit author
 * [ ] Code modified for feature
 * [ ] Test suite updated with functionality tests
 * [ ] Test suite updated with negative tests
 * [ ] Documentation updated
 * [ ] CI timeout is 3h or higher (see Settings/CICD/General pipelines/
Timeout)

## Reviewer's checklist:
 * [ ] Any issues marked for closing are addressed
 * [ ] There is a test suite reasonably covering new functionality or 
modifications
 * [ ] Function naming, parameters, return values, types, etc., are consistent 
and according to `CONTRIBUTION.md`
 * [ ] This feature/change has adequate documentation added
 * [ ] No obvious mistakes in the code
====== /template ======


Settings -> General -> Merge Requests -> Default description template for 
merge requests


Thanks


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



