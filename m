Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65E14D561
	for <lists+samba-technical@lfdr.de>; Thu, 30 Jan 2020 04:40:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ecgDIRlaXBwoQEpgNoqgE17XeCASHz7xplSZ2VE9IVo=; b=fDJIdrFCk35Bcy+tXJNtsOK3f1
	6iNUHI/FZZR5lytLTmx5K318lUwI+f0ti76ey3A4EQYR1b//tZ+d352cLAzycimkvyu9rmOLtshBj
	/eHvbvnu2bpK78dMuOQSn51XlGdJtd5gJ762nMKRT7WZ6ETOavXHxGiO8oYZCYcdp2inpgY3PolDn
	zdcDSwgyWgaeaB19e6Dn0KBJdVMeJgRThmMGCyk1LAZzAF39ckp5GIFVZnDK6DfbqaOQcMD+MojCf
	hcImyfuz2aQqqwpkEE8eb/rGcH6gjqtpGCrSypJIWgTwI7st2Cb4paD05QSFokJqeQuE/KF3JrXsQ
	7tgyc5nw==;
Received: from localhost ([::1]:36372 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1ix0fj-005RGK-2j; Thu, 30 Jan 2020 03:39:15 +0000
Received: from userp2130.oracle.com ([156.151.31.86]:46982) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1ix0fd-005RGD-LL
 for samba-technical@lists.samba.org; Thu, 30 Jan 2020 03:39:12 +0000
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00U1r4L1117242;
 Thu, 30 Jan 2020 01:54:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=ecgDIRlaXBwoQEpgNoqgE17XeCASHz7xplSZ2VE9IVo=;
 b=qVJw16Vccb5PJ/8bEMeZ5hlqFMDsXEG6h0IuqVGlZiayps77itHQQ9AFUg52kMibrqiH
 sCqdml9ywwxzghItNKz93AGxXm2mLApiol1yF8OZeuHs3rTSaHFG0w5UrVY3zp3yZXJI
 x9ayFV0EYvJ2WsWvXLcef/8Zeq/Tsle3+iohS+yNa1tapKnq0tOj4UPx17Hs443tpMjU
 x1OPMSwKmIO7xrLbRX5DTVFjYK1ohmoK/OHLcxxURXAFtDVhvtLy/CcWQ/xSeAfdMGsr
 YjqwFsH2o+m7cJNyvYnVXSPqOsbNlUJLWEW6wsanMxe9cEa2LnHPdAIi0+kBeWoNPIaW vw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 2xrd3uh63j-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 01:54:15 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 00U1hjbt080079;
 Thu, 30 Jan 2020 01:52:14 GMT
Received: from userv0122.oracle.com (userv0122.oracle.com [156.151.31.75])
 by userp3030.oracle.com with ESMTP id 2xuemva2br-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 30 Jan 2020 01:52:14 +0000
Received: from abhmp0010.oracle.com (abhmp0010.oracle.com [141.146.116.16])
 by userv0122.oracle.com (8.14.4/8.14.4) with ESMTP id 00U1qBo2025023;
 Thu, 30 Jan 2020 01:52:11 GMT
Received: from localhost (/10.159.240.218)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Wed, 29 Jan 2020 17:52:11 -0800
Date: Wed, 29 Jan 2020 17:52:10 -0800
To: Steve French <smfrench@gmail.com>
Subject: Re: [LSF/MM/BPF TOPIC] Enhancing Linux Copy Performance and Function
 and improving backup scenarios
Message-ID: <20200130015210.GB3673284@magnolia>
References: <CAH2r5mvYTimXUfJB+p0mvYV3jAR1u5G4F3m+OqA_5jKiLhVE8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH2r5mvYTimXUfJB+p0mvYV3jAR1u5G4F3m+OqA_5jKiLhVE8A@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
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
From: "Darrick J. Wong via samba-technical" <samba-technical@lists.samba.org>
Reply-To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: linux-fsdevel <linux-fsdevel@vger.kernel.org>,
 CIFS <linux-cifs@vger.kernel.org>, lsf-pc@lists.linux-foundation.org,
 samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Wed, Jan 22, 2020 at 05:13:53PM -0600, Steve French wrote:
> As discussed last year:
> 
> Current Linux copy tools have various problems compared to other
> platforms - small I/O sizes (and most don't allow it to be
> configured), lack of parallel I/O for multi-file copies, inability to
> reduce metadata updates by setting file size first, lack of cross

...and yet weirdly we tell everyone on xfs not to do that or to use
fallocate, so that delayed speculative allocation can do its thing.
We also tell them not to create deep directory trees because xfs isn't
ext4.

> mount (to the same file system) copy optimizations, limited ability to
> handle the wide variety of server side copy (and copy offload)
> mechanisms and error handling problems.   And copy tools rely less on
> the kernel file system (vs. code in the user space tool) in Linux than
> would be expected, in order to determine which optimizations to use.

What kernel interfaces would we expect userspace to use to figure out
the confusing mess of optimizations? :)

There's a whole bunch of xfs ioctls like dioinfo and the like that we
ought to push to statx too.  Is that an example of what you mean?

(I wasn't at last year's LSF.)

> But some progress has been made since last year's summit, with new
> copy tools being released and improvements to some of the kernel file
> systems, and also some additional feedback on lwn and on the mailing
> lists.  In addition these discussions have prompted additional
> feedback on how to improve file backup/restore scenarios (e.g. to
> mounts to the cloud from local Linux systems) which require preserving
> more timestamps, ACLs and metadata, and preserving them efficiently.

I suppose it would be useful to think a little more about cross-device
fs copies considering that the "devices" can be VM block devs backed by
files on a filesystem that supports reflink.  I have no idea how you
manage that sanely though.

--D

> Let's continue our discussions from last year, and see how we can move
> forward on improving the performance and function of Linux fs
> (including the VFS and user space tools) for various backup, restore
> and copy scenarios operations.

