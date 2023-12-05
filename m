Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A2686805F68
	for <lists+samba-technical@lfdr.de>; Tue,  5 Dec 2023 21:28:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:To:Subject:Date;
	bh=7RnicbRYr4MjN0ahmWNWJIZL0VOp3Mp2AR5YZ+p8wLM=; b=QGUGeZ9atq+4+yv2/1LpdhfsRe
	6m18MHvrUWnTYKK6vdsezA9iFxj9sJzgt3t4zoPoimeyUbMR/9mgkfgnq2a3j/967RninX2kgveiH
	7RuqkNOUps5aygTiEO60/wedoTeP6fLqvnxUn7YAC7c6BsjqQVaNHhHadOrCjEMZwgD05TjTQNqx8
	nUEM/eP+jM+Ar11vbsaeHs3VXONRDmHsvTK7G3k3J5BZAdyQSYKRQcPlvvrbfsXg+++gZYOXHBfv7
	iYP8yDMfj8Unf/c0zefbdgw70g6W4OygNJu4gWRHldpOnQRCQtkCV3vjXs6Go6pxXcFWjEX1Vm1N5
	IRmB+WTQ==;
Received: from ip6-localhost ([::1]:46010 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1rAc1m-004XE2-Mq; Tue, 05 Dec 2023 20:28:22 +0000
Received: from mail-yb1-xb30.google.com ([2607:f8b0:4864:20::b30]:55510) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1rAc1h-004XDs-Ol
 for samba-technical@lists.samba.org; Tue, 05 Dec 2023 20:28:20 +0000
Received: by mail-yb1-xb30.google.com with SMTP id
 3f1490d57ef6-db544987c79so4513740276.2
 for <samba-technical@lists.samba.org>; Tue, 05 Dec 2023 12:28:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701808094; x=1702412894; darn=lists.samba.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7RnicbRYr4MjN0ahmWNWJIZL0VOp3Mp2AR5YZ+p8wLM=;
 b=eSljXhM3AcKXf/dLvqKXSCNGzyCug9asfmktTy3rxByI+jV1vYhmb0CqQhrtTxtqgZ
 BeougHZvGFeaI/r2v6yTvNQsz2ADzzof1vrvZfXhezLNv0R3HTxHO2frKjXXJG1AKEW5
 oWZgQYWco7DLPdl21ccnL2uAE7nY1s9yqe2YeKBilZq+XTMURIa3g7XKVaTLjEHzw9p6
 BzV1nHIJwh1YISPSROeO7oxLuYshwIh7ZGIjU2DlHGJC4V5VS2Dy83xNAxPVS2vKM9MX
 dswiK2SjqrVZDkwksgW5GR/h7hLBpyzlQl2ACGmx8iDTV+ESRzo7CGCdG+zPdJKr+HFZ
 Ovlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701808094; x=1702412894;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7RnicbRYr4MjN0ahmWNWJIZL0VOp3Mp2AR5YZ+p8wLM=;
 b=CgPRm7O/bDiaxPF2SDrMsoWfZ08y0EqNXEheQtze5W6R4FjuIslS382RT1Xk+COuWR
 k4KO0/N3mRcml9yGYYYeefXKX4a0ee/phJdstaIoujw/G7+BjjHtlw6lrXu/cLIHaAZU
 vxGDcWkSRwEEBBTOlibaPSQrH9kPaHVTC+YYmECkmV5/9Ek9pX0xTAu7ZmZre0KSCXod
 GOR6MZCEgUaelg/mNmGIW7ABL+BQb9tBEVCFF1n8mqwA9Ve8r0CqimpAQUkgMORchgr4
 JIGpBi6KHBWTec75oc1Lds9JYpccfrXc3ablAicAxl9Yi6zTVA9V8hmdiG5nd7WqYR9e
 Evjg==
X-Gm-Message-State: AOJu0YzXe001F2JUBbwMRVrDDqkTDww4zjPv1xK8oqOVyamVgKjG6HXS
 6Now5nizrMj2kWUjqpeTwxekgwsNzjjOUQTT+yRk8K3Y
X-Google-Smtp-Source: AGHT+IEcAo6wB0/bcUyNF72hTB4iISLM06XrFBDitIy+nWKtK0OxEBJQgwaZj5umQ9sLVTd6u/iTkfgnRyrFSKqAEC8=
X-Received: by 2002:a25:3614:0:b0:db5:4998:86eb with SMTP id
 d20-20020a253614000000b00db5499886ebmr5368630yba.53.1701808094187; Tue, 05
 Dec 2023 12:28:14 -0800 (PST)
MIME-Version: 1.0
References: <CAD0Ztp3ZoJTyiEa_MYgvHHrivWW-KAgDTrjH0Yz-BGDPWUnozg@mail.gmail.com>
 <1017032a-b5c9-4ee2-8f24-c113d5839bc0@samba.org>
In-Reply-To: <1017032a-b5c9-4ee2-8f24-c113d5839bc0@samba.org>
Date: Tue, 5 Dec 2023 15:27:57 -0500
Message-ID: <CAD0Ztp3T-7OZ7w17=bEjTwE_0-1pBXfn3k8JZ63Si_5YKANvmw@mail.gmail.com>
Subject: Re: Oplock Lease stress test?
To: Ralph Boehme <slow@samba.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
From: Gordon Ross via samba-technical <samba-technical@lists.samba.org>
Reply-To: Gordon Ross <gordon.w.ross@gmail.com>
Cc: _samba-tech <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks.  I use those, but I'm looking for more interactions between
open handles and a variety of file system operations, more like a
real-world workload (and preferably with some randomness and ability
for a significant number of virtual clients).

On Tue, Dec 5, 2023 at 3:23=E2=80=AFPM Ralph Boehme <slow@samba.org> wrote:
>
> Hi Gordon
>
> On 12/5/23 20:20, Gordon Ross via samba-technical wrote:
> > Can anyone suggest a stress test for exercising SMB server oplock and
> > lease activity?
>
> smbtorture bench.oplock1, smb2.oplock, smb2.lease ?
>
> Hth!
> -slow

