Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id C24DE27790B
	for <lists+samba-technical@lfdr.de>; Thu, 24 Sep 2020 21:17:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=wT0HGByh2756wrTpXefrCan9ih9DdTalIsXywe9z0A4=; b=l4y2/vxpS5ylNiNIX73uD2qA6t
	5Qqk98eletZdQx3VipJi4BXP6K3gW/1z1rIva+qKLvSNuQ6W/OvKerzAr86JfcpLIh4PTDSu+9zWJ
	PMs2oxk65b0ePVPOjI9Mb5nkySYkH0fi7DsXXhKza3WQPjHf0rONDGFR6azappWDVSrTua/4G1/vh
	vqObXpe+glSDebNuUiWbjGwZIwZ5EIHdu/ga8WD+7ch+32P0I1ed8/wpr0xcEcolgq0g+rujJlLFV
	Ucq9s8MGXejKqnLHoQ6N/D4XEHVSLrOePUIUKtwin5PMAjVjFiEb3Y94ZMDSghBxKgXRo25EVDD9a
	NHwGEURw==;
Received: from ip6-localhost ([::1]:22786 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kLWkH-007AL3-JU; Thu, 24 Sep 2020 19:17:33 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:33396) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kLWkC-007AKw-Fg
 for samba-technical@lists.samba.org; Thu, 24 Sep 2020 19:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=wT0HGByh2756wrTpXefrCan9ih9DdTalIsXywe9z0A4=; b=S+WIjnTapoNWQwb3mE9S8FUPms
 afbbYFfP/Y4qGOPVezgZpsJjKWyK57QGNrAJUOEosmSrKrwpOlKiSyAlZn/tSJhVxx2LBScIKPhCW
 WJn6+DUIYnBarMh33Kn9QpkuQ34EgQi2ciFLL9uKOmavEvF5lIkdqS2mWY7afXPiS4jNNINm6KwpR
 pG+9VwOaC8+QcVoc/xk3akfqg9qO1b6Mv9Veuy9kA3SmNMgNXzAQNeaU6vSm3i51ZNP86HMN+2z31
 lrQpzcKIQ1cu6SyxUOC2mrv1bHckCqbM7Pbq6U7vSOTqCDdgTlhv7j24OL0cBfeReWSw0MBJZeudS
 lOmZcm6lgUV1e9vWXudjcXj8DIy8sonMslp3iNWkM+O6kK7nOVeHfVAtUdSs9jI/oKwAMlEcqyA5K
 aXD072GN64lrg+sBbTuc6iZCiFc7kfc4AowWaN6CdDNt/2GjpSWA95K0Vn7b9YsBGQbs85XSiN0nP
 HqIKg9L1b799DnjzWhAs8jNI;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kLWkB-0008Qy-Gh; Thu, 24 Sep 2020 19:17:27 +0000
Date: Thu, 24 Sep 2020 12:17:22 -0700
To: Ashok Ramakrishnan <aramakrishnan@nasuni.com>
Subject: Re: [EXTERNAL] Re: Need tips on debugging assert_no_pending_aio()
 cores
Message-ID: <20200924191722.GA1443735@jeremy-acer>
References: <BN7PR07MB4402C07BF8C5EB753481AD53CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
 <20200924160454.GA1395554@jeremy-acer>
 <BN7PR07MB44024662698A1214F98D4570CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BN7PR07MB44024662698A1214F98D4570CF390@BN7PR07MB4402.namprd07.prod.outlook.com>
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
From: Jeremy Allison via samba-technical <samba-technical@lists.samba.org>
Reply-To: Jeremy Allison <jra@samba.org>
Cc: "samba-technical@lists.samba.org" <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thu, Sep 24, 2020 at 06:54:38PM +0000, Ashok Ramakrishnan wrote:
> Thanks Jeremy for the tip. We are able to reproduce the issue after a few hours of IO. I re-read the comments and the code and have one follow up question.
> 
> Is it possible for talloc_realloc() in aio_add_req_to_fsp() and aio_del_req_from_fsp()
> to race?

No, that shouldn't be possible. Remember, this part of the
code isn't called from threads. The setup/teardown of the
aio is done in the serving smbd, which is asynchronous but
single threaded in this code.

The code path in schedule_smb2_aio_read() does:

        req = SMB_VFS_PREAD_SEND(aio_ex, fsp->conn->sconn->ev_ctx, fsp,
                                 preadbuf->data, smb_maxcnt, startpos);
        if (req == NULL) {
                DEBUG(0, ("smb2: SMB_VFS_PREAD_SEND failed. "
                          "Error %s\n", strerror(errno)));
                TALLOC_FREE(aio_ex);
                return NT_STATUS_RETRY;
        }
        tevent_req_set_callback(req, aio_pread_smb2_done, aio_ex);

        if (!aio_add_req_to_fsp(fsp, req)) {
                DEBUG(1, ("Could not add req to fsp\n"));
                TALLOC_FREE(aio_ex);
                return NT_STATUS_RETRY;
        }

The default for vfswrap_pread_send() sets up the
underlying thread in the threadpool, then returns
the tevent_req pointer to the caller and adds
it to the async array in aio_add_req_to_fsp().

I can't see a way for that to get out of sync,
unless you have something strange inside your
SMB_VFS_PREAD_SEND() function (and you're not
using the default).

> Since the array is being mem copied when the size is incremented 10 at a time...

Not at the same time.

> I am adding some instrumentation to the code to see if we are running into
> this situation here. But, we seem to end up with a case where fsp->num_aio_requests = 1,
> while the fsp->aio_requests has been freed (because all the outstanding aio requests have been destroyed).

Massive, overkill instrumentation to catch this
is what you need to debug this I think.

It's possible there's a logic bug, I just
don't see it (yet).

Jeremy.

