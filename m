Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B3269B54603
	for <lists+samba-technical@lfdr.de>; Fri, 12 Sep 2025 10:52:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=lC/6GGy0XELd5gPueFYlr0PRgrThOeKx8qfZ3638MvY=; b=LV1J3VPMmvQmorbkjafHrG1ptQ
	MHtt+8/GgsO9zbJf209BI9tn2OqdQii2/quOsxUJm5ZD7f2eesoUmwDh6vJV/PIjqwgL3Qwjusuf0
	L4TNfp6QU0sx3zI6pGITRQ/yMtZhjos/SJ9l5ukW9xQaeiRivk5YnKhpZzI2PPXS7qLAmVkXlaVdb
	FUjy3UUO5KTcmjlJfHbeqA6RlkUga10UmMR1QQxX9Hy+qC3bh449PIntIRjrZXIgVDNOUYxrziKYL
	Jvfk4lEXta2DpDbHzSbZGPwgOKSy1D4XwqUb4AZNrjbprKp1Bp71cgVGoh52BzmOREjeflKH72TOQ
	wO+sIfnA==;
Received: from ip6-localhost ([::1]:60984 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1uwzWU-003cxh-Jh; Fri, 12 Sep 2025 08:52:50 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:19526) 
 by hr1.samba.org with esmtps
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwzWM-003cxC-Oc
 for samba-technical@lists.samba.org; Fri, 12 Sep 2025 08:52:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=From:To:Date:Message-ID:CC;
 bh=0dXmBGY4+GDrd1E9bnbYOQ7beV15T4j9VVQM8CDvtqA=; b=GRPZhgmLgcenpdx0AREZtTFtCd
 5mhL8XQLuOVN8b45qGnOMa4GW+nkdXtQZYouUCACKbD75zf4CATYw0eb/qXVtJVGdWEWYwM6kMpV4
 YRFuoiKrR3Ao2Q2pvtq0vWvOq8qV6c1B4e12cCRIOxMpKAODPnxVNU7/rlOM2A+ow47M+L83huJ/G
 emEJMVeTQkELF0sY3vzKr+Z6sBiNrIFsdqHx+eAMdOAJ5UksAvu6ulPWKdsNg4s717AhDN9Yg4tkI
 okJuQ8twmDCF5561PxKOD2rqNRciXsH0OP15p8Zf6EQ+s3Txr7qEDGWRf87o15jJqE37yeMAcdj+f
 l0n6KyzNGmRBzCN31nILXLQp6QXEEAhC1HTqpr4X9AKoUFOOOy3MGNRQpBfqK9S3j/fq9R7zGE5zY
 qEUviBw6CdfocIsttsR4G7Y/xgLTR5aptimpIAMVUk2ooki9kICJlcOjC7LCfNgZGQ7MbfWRKq3si
 t69QNr0UIIsEQhgJTdS83+Dc;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1uwzWM-003lXd-0Q for samba-technical@lists.samba.org;
 Fri, 12 Sep 2025 08:52:42 +0000
Message-ID: <891dc371-a64d-4ca6-8af2-4441eb70c252@samba.org>
Date: Fri, 12 Sep 2025 10:52:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: de-DE
To: samba-technical@lists.samba.org
Subject: [Release Planning 4.23] Samba 4.23.1
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
From: Jule Anger via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jule Anger <janger@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi,

with today's release of Samba 4.23.0,
- Samba 4.22 has been turned into the *maintenance mode* and
- Samba 4.21 into the *security fixes only mode* (there will be a last 
bugfix release in November).
- Samba 4.20 is end of life now.


Samba 4.23.1 is scheduled for Friday, October 24 2025.

https://wiki.samba.org/index.php/Release_Planning_for_Samba_4.23
has been updated accordingly.

-- 
Jule Anger
Release Manager Samba Team  samba.org
SerNet Samba Team           sernet.de
