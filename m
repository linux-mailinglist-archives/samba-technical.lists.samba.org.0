Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 957BA14CF56
	for <lists+samba-technical@lfdr.de>; Wed, 29 Jan 2020 18:11:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=TYaVr44UO4bVLWLnj9jwJBE4ylWGgvtE2R8I0jC8zIo=; b=fDRqgH2AKhgBvXsvNXmd7TE6z6
	rNbG6f+hIFqQz2uS6pYVv9utnIVXbolXJH6kwxid9D4hnP/P6NaowqtoEl8zeIsRkvxacV/fdAcvf
	HkIZzj/4hSN+0iXxwQfZdwGU8L2CuklYYgaa6J02TWHtBIkZZ6+9WHjZ8v2gOlWtwQYQrRW1zepB5
	1i7FZNH+IN8raENdee/jAGJi16esRWlqNApJJ777SnDogIo2NWJefCh38M41JUVr+p+MocksaG4z1
	JFETAv20WFbbqvlVNFJCSeL4Dv/CKYvw+mdrtT9sXQq3DpPmaPJZSNbMPScXnmrBXM+YHIRlZrG7r
	ZQk+sYgg==;
Received: from localhost ([::1]:40830 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iwqsG-005K5L-HM; Wed, 29 Jan 2020 17:11:32 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:41470) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwqsB-005K5E-Td
 for samba-technical@lists.samba.org; Wed, 29 Jan 2020 17:11:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Message-ID:From:To:CC;
 bh=TYaVr44UO4bVLWLnj9jwJBE4ylWGgvtE2R8I0jC8zIo=; b=d+5z1RRmA4DGrztAeYdPuPzuiJ
 zgMQmEHE9XwtJPt+Wr3qEpiJFRObs13EMq5UgSgwI5HN+YnaXRiocU6ycSMY/ElcLQgg0IL9E0L0p
 TlMhgCVCWlCD7Rlo5KjrkXjo3TfvEbuEDRM85I9gQJID1SfkFCBvEZW5ZA/EtB9JWXXY6JDFguYYi
 D6WoKxrgUeUHYw5YzYcA6uAy8kg0ra5nsORR/R+myuoC6MFB6h6ULmFgXJHcEMtwuA82JRD+oN93/
 8smjTafh2tLcN2k2PMtZQKMf4nASHSKh9A7+sblDViUyv6Reh6aNU01onpQSkCUYce/mBA0hYVH6c
 LmFSkBgGOeNFEB6eNkwF8hwrQeZJ5g7oOGDODrNBro3w9lCsUf2i3cYSIePO28nVuMmNkHAkFYN1w
 HV+6OA6mYf+HiFqrGULSl0P3LqWf3ujgGOfIMLp+xN8LT5D6VW3QQpm+VlZSoo++NJoqNCWqieD/3
 Hy11pRAdYVuOQPIBrykU4zxf;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iwqsA-0007O9-Sm; Wed, 29 Jan 2020 17:11:27 +0000
Subject: Re: The samba3.base.delete test
To: Andreas Schneider <asn@samba.org>, samba-technical@lists.samba.org
References: <1772232.gcRF95uoko@magrathea>
Message-ID: <50d2453f-0412-d41e-a1fa-4f6e1543a816@samba.org>
Date: Wed, 29 Jan 2020 18:11:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <1772232.gcRF95uoko@magrathea>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
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
From: Ralph Boehme via samba-technical <samba-technical@lists.samba.org>
Reply-To: Ralph Boehme <slow@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Am 1/29/20 um 5:47 PM schrieb Andreas Schneider via samba-technical:
> The deltest20 of base.delete works if you run it as a user, but it fails if 
> you run it as root!
> 
> Is this a bug or expected behavior?

sounds like a bug, -v please.

-slow

-- 
Ralph Boehme, Samba Team                https://samba.org/
Samba Developer, SerNet GmbH   https://sernet.de/en/samba/
GPG-Fingerprint   FAE2C6088A24252051C559E4AA1E9B7126399E46

