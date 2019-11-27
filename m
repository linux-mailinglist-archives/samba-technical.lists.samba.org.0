Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D6B10A9D3
	for <lists+samba-technical@lfdr.de>; Wed, 27 Nov 2019 06:08:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:To:Subject:cc;
	bh=NJ9tClLI9cHMiHvefC1SP4vBoSHC637RobrrSX5kJUU=; b=ifNIvrVfmdcK6n0v41Fhx4CjMi
	DK7JV8weLzuWGcNIkPEsDqump/opduWJP8lP2TYLh94NPFLFhiTDSeLRUjmoouPmNSkuyT0RHin1j
	j1SDDoNxiHAmSf5vS30qAmnfz5oSefKVX80A40O6wxHwh4kMHhlyO659x8NP27/hwoYZtdPABzP+5
	iXVFsI8C+GM9mc6I1E0ng1ZHvLtuwemiLmpbeKevCYRaYFGDT16xdiL54Y06uFV0KxOgpfjgJosJo
	1pJi4kYxvFsxiMfvUop/3ZVrwKxiDxwpl7Co+cSLSXi+L3WECd9SQQW4wAyAP9EiOA8cghtW2MSUp
	PQaFPjYg==;
Received: from localhost ([::1]:62900 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iZpXn-002bLf-Ug; Wed, 27 Nov 2019 05:07:16 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:62358) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZpXg-002bLY-EV
 for samba-technical@lists.samba.org; Wed, 27 Nov 2019 05:07:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:To:From:Message-ID:CC;
 bh=NJ9tClLI9cHMiHvefC1SP4vBoSHC637RobrrSX5kJUU=; b=T/mWm1MP3+S9ZoeLspO/ZJdjYF
 PsYFPTqVn2tk0BLbSJjMndy3TUq+NE+5QVytE8mp2pJlv5PW3GDZ8yhH9z+DG8Qmye1KP6qKTZ6Kw
 rqSA5zVl5wggUI4GsyxTM7cQed3sNmMQLxUTkUIay2bVLKkbCmfkG3BctK+se+/1BlJ4TWOvDyPEz
 M0e2MDfmqvOw6jcO3xnSfUAUt5n91jXvocNBawfKUt0DIA3m7S52CkzAtzcCB/0JSS9oOwM6wPICD
 TqmqvnCyXCqhpWJ4a3vGX9PhpOFYOBvSKrmEf7ww1xg0kUIQZrKVH4Xfyyw8nGdLfMEwgr66DhirR
 KmHjhC4nUfjbwY9N+cMXczpKAMY80l6GpyN4kow4ghea9spfV6FchJxIba4z3pdLlJnX2L1Dk2WVV
 yG/gJDtKu0Lpa7VMcitebSUbhZU3sto3Gm29qFtEgaZ8iknmO74N4D7nHUGRn9qGOg3z5LwCLM9Bm
 eNkDjkEolD+LH/nk/64qZ0be;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_CHACHA20_POLY1305:256)
 (Exim) id 1iZpXe-0005FQ-Ap; Wed, 27 Nov 2019 05:07:06 +0000
Message-ID: <28a851709bc2447081fc5d55abadbe8bde780e79.camel@samba.org>
Subject: Re: MR !854 | sess_crypt_blob() fails to decrypt its own cipher text
To: Isaac Boukris <iboukris@gmail.com>, Upstream Samba Technical Mailing
 list <samba-technical@lists.samba.org>
Date: Wed, 27 Nov 2019 18:07:01 +1300
In-Reply-To: <CAC-fF8REXgwh+cdLcucsOA=5NAFWuAva1g_LOztbK8Eu+ojBuQ@mail.gmail.com>
References: <CAC-fF8T2bviHcpRgmjmVoiAvtpLEmFkr-5P9Q9dr=AoKCiEyMw@mail.gmail.com>
 <CAC-fF8REXgwh+cdLcucsOA=5NAFWuAva1g_LOztbK8Eu+ojBuQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
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

On Sat, 2019-11-23 at 14:30 +0100, Isaac Boukris via samba-technical
wrote:
> On Thu, Nov 21, 2019 at 6:52 PM Isaac Boukris <iboukris@gmail.com>
> wrote:
> > 
> > While adding tests for sess_crypt_blob() I noticed it fails when
> > the
> > input is not aligned to block size of 8, and it looks like we
> > always
> > use it this way (see also comment above sess_encrypt_string()), see
> > pipeline:
> > https://gitlab.com/samba-team/devel/samba/commits/iboukris-dtest
> 
> I now realize this branch doesn't prove much, since callers don't
> check the return value yet, but i also tested with abort().

I've checked the callers in the server, and I'm pretty confident this
size requirement (being a multiple of 8) is an axiom you can trust.

Andrew Bartlett

-- 
Andrew Bartlett
https://samba.org/~abartlet/
Authentication Developer, Samba Team         https://samba.org
Samba Development and Support, Catalyst IT   
https://catalyst.net.nz/services/samba






