Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id A4CAA355FC5
	for <lists+samba-technical@lfdr.de>; Wed,  7 Apr 2021 01:52:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eCAtJrT0bckkhlNg/f4/ykivU1MKm7aC8EavZBZvzkI=; b=2CWFasmtK0DlNFGX35HeFUcGNU
	Qf5b7KTOlkI50K/DVVthrIJ5QS6fDVfv5YzUGEwvmxZ64tFKPKlXKgzFN1prqPg8ZgAIpbRw8AdQd
	SuYCM6EBAYhap0w+hbburM5rpIoZxLSvD72ZCKUmms6q7oKO5noLK9N1AdqA1SBnwV7NBl6Li/NgR
	c4TzurePjPJp6WSP/zl8ALho5vYqU+203zVgNf8Clgx1dd/fs9dfgTCTcmlTWGzUlL1HCA0P1VF2v
	V0MlGLMEwatEmn+gRExNp9pB1Ho65EIdZuzk5JTjt09A8sJfqJJXDENagZsjlft/7nyH7dUP5Wehl
	/LLrOu3A==;
Received: from ip6-localhost ([::1]:25098 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lTvU3-00AGqY-Qz; Tue, 06 Apr 2021 23:51:47 +0000
Received: from [211.29.132.59] (port=37594 helo=mail108.syd.optusnet.com.au) 
 by hr1.samba.org with esmtp (Exim) id 1lTvTx-00AGqR-R4
 for samba-technical@lists.samba.org; Tue, 06 Apr 2021 23:51:45 +0000
Received: from dread.disaster.area (pa49-181-239-12.pa.nsw.optusnet.com.au
 [49.181.239.12])
 by mail108.syd.optusnet.com.au (Postfix) with ESMTPS id D446C1AEB59;
 Wed,  7 Apr 2021 09:19:25 +1000 (AEST)
Received: from dave by dread.disaster.area with local (Exim 4.92.3)
 (envelope-from <david@fromorbit.com>)
 id 1lTuyj-00DXI3-4m; Wed, 07 Apr 2021 09:19:25 +1000
Date: Wed, 7 Apr 2021 09:19:25 +1000
To: Steve French <smfrench@gmail.com>
Subject: Re: [PATCH][CIFS] Insert and Collapse range
Message-ID: <20210406231925.GE1990290@dread.disaster.area>
References: <CAH2r5mvhUQEqXQmrz5KKbTCFaeS5ejZBGysaeQVC_ESSc-snuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mvhUQEqXQmrz5KKbTCFaeS5ejZBGysaeQVC_ESSc-snuw@mail.gmail.com>
X-Optus-CM-Score: 0
X-Optus-CM-Analysis: v=2.3 cv=YKPhNiOx c=1 sm=1 tr=0 cx=a_idp_x
 a=gO82wUwQTSpaJfP49aMSow==:117 a=gO82wUwQTSpaJfP49aMSow==:17
 a=kj9zAlcOel0A:10 a=3YhXtTcJ-WEA:10 a=7-415B0cAAAA:8
 a=mhv_l09cUW-47tK0WSYA:9 a=CjuIK1q_8ugA:10 a=biEYGPWJfzWAr4FL6Ov7:22
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
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Apr 01, 2021 at 01:30:28PM -0500, Steve French wrote:
> Updated version of Ronnie's patch for FALLOC_FL_INSERT_RANGE and
> FALLOC_FL_COLLAPSE_RANGE attached (cleaned up the two redundant length
> checks noticed out by Aurelien, and fixed the endian check warnings
> pointed out by sparse).
> 
> They fix at least six xfstests (but still more xfstests to work
> through that seem to have other new feature dependencies beyond
> fcollapse)
> 
> # ./check -cifs generic/072 generic/145 generic/147 generic/153
> generic/351 generic/458
> FSTYP         -- cifs
> PLATFORM      -- Linux/x86_64 smfrench-Virtual-Machine
> 5.12.0-051200rc4-generic #202103212230 SMP Sun Mar 21 22:33:27 UTC
> 2021
> 
> generic/072 7s ...  6s
> generic/145 0s ...  1s
> generic/147 1s ...  0s
> generic/153 0s ...  1s
> generic/351 5s ...  3s
> generic/458 1s ...  1s
> Ran: generic/072 generic/145 generic/147 generic/153 generic/351 generic/458
> Passed all 6 tests

FWIW, I think you need to also run all the fsstress and fsx tests as
well. fsx, especially, as that will do data integrity checking on
insert/collapse operations.

`git grep -iwl fsx tests/` will give you an idea of the extra fsx
based tests to run....

Cheers,

Dave.
-- 
Dave Chinner
david@fromorbit.com

