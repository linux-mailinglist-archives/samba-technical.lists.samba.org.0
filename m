Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8197A4C694
	for <lists+samba-technical@lfdr.de>; Thu, 20 Jun 2019 07:11:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Tvm8C8jjBC2p6XPpJ1zYNuTEfGr2LVDWp12w8sEc1UE=; b=1q6Jt1DvzVYal9yfFV162l0Cjg
	FmkAiWQM5WrhLrj6zLwLMKUxiqal0ft8jrvuDaELfdmzV6F69wOmvlWn15YAM3KKD1pTEBw8tp55Y
	meR41QcsejPmAA0m1TZFsQL4uRt1lvC70A2SzEq7E3XIl5BmpMdkYOPszwu7wmIAxyDgliIOk1hLS
	t46OrLjivA9G38i1e9aFKJ14pShS9NmEOWlmHTaYvGLlxjdlR98QhRIn5wIWYD/biaXZqX24M0G3+
	TkVmlvbH4PTrqR8mRgnmi3af3KRec0Y1qQhxAVAc9itRWL8tz+oWAZ4JdRGYXenNvxdLz0g++Ehv8
	oL9wqAOQ==;
Received: from localhost ([::1]:49890 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1hdpMD-000ahi-5K; Thu, 20 Jun 2019 05:11:33 +0000
Received: from [211.29.132.246] (port=46329 helo=mail104.syd.optusnet.com.au) 
 by hr1.samba.org with esmtp (Exim) id 1hdpM7-000ahb-T4
 for samba-technical@lists.samba.org; Thu, 20 Jun 2019 05:11:30 +0000
Received: from dread.disaster.area (pa49-195-189-25.pa.nsw.optusnet.com.au
 [49.195.189.25])
 by mail104.syd.optusnet.com.au (Postfix) with ESMTPS id B265A4395F5;
 Thu, 20 Jun 2019 14:53:08 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92)
 (envelope-from <david@fromorbit.com>)
 id 1hdp3T-0000H9-9G; Thu, 20 Jun 2019 14:52:11 +1000
Date: Thu, 20 Jun 2019 14:52:11 +1000
To: Steve French <smfrench@gmail.com>
Subject: Re: [SMB3][PATCH] fix copy_file_range when copying beyond end of
 source file
Message-ID: <20190620045211.GU14363@dread.disaster.area>
References: <CAH2r5ms8f_wTwBVofvdRF=tNH2NJHvJC6sWYCJyG6E5PVGTwZQ@mail.gmail.com>
 <CAN05THSoKCKCFXkzfSiKC0XUb3R1S3B9nc2b9B+8ksKDn+NE_A@mail.gmail.com>
 <CAH2r5mu0kZFhOyg3sXw6NVaAjyVGKuNdRGP=r_MoKqtJSqXJbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mu0kZFhOyg3sXw6NVaAjyVGKuNdRGP=r_MoKqtJSqXJbw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.2 cv=P6RKvmIu c=1 sm=1 tr=0 cx=a_idp_d
 a=K5LJ/TdJMXINHCwnwvH1bQ==:117 a=K5LJ/TdJMXINHCwnwvH1bQ==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=dq6fvYVFJ5YA:10
 a=7-415B0cAAAA:8 a=UWJoro48fT9aPvQt_DUA:9 a=Tx8gwBvrB81qvhLj:21
 a=jfgipEjfrgx7MPLy:21 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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
From: Dave Chinner via samba-technical <samba-technical@lists.samba.org>
Reply-To: Dave Chinner <david@fromorbit.com>
Cc: CIFS <linux-cifs@vger.kernel.org>,
 "Darrick J. Wong" <darrick.wong@oracle.com>,
 Amir Goldstein <amir73il@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>,
 linux-fsdevel <linux-fsdevel@vger.kernel.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jun 19, 2019 at 10:19:30PM -0500, Steve French wrote:
> Local file systems that I tried, seem to agree with xfstest and return
> 0 if you try to copy beyond end of src file but do create a zero
> length target file

The zero length target file that remains after cfr returns zero
because src > EOF was not created by cfr.  i.e. the destination file
has to be created by the application before cfr is called. Hence
what you see here is the result of running cfr to an existing zero
length file and copying zero bytes to it....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

