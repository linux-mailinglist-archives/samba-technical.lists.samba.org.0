Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 8568E332767
	for <lists+samba-technical@lfdr.de>; Tue,  9 Mar 2021 14:42:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=IX5Ccrifhwn+TfdveaPZcVPwzE7RzbHoY8Z21/LsAAI=; b=iLsS8wDgJ4ElpQXitJTjZxjiz+
	HkuYCwWduJ8VW6bkz13zOF1vY9sUAG2d707xnqKQ/ebGr2flXdeki9cHyBwH3t7+ppSWwso1SXE60
	Q+JyiTtSfVQYBLhUEGPRoeaCI0BPCdA1rsPMYSvDv9lQ+OMk+yIcnCk66298T9SaE5NH2lZGVQYYd
	qp78JEcFI7nMCBKvu2XItUiuTo9Kgjh7V9TUq40NvdjFE7o/upoSK9MpNSG/EcCVZRNm57PzcyUVa
	eDWmd6Zw2/MEhPpTs8PTxUEKlr66lnX4noxUZXy+gWrmE/4iXCqItwpiH4bcf1tNeNtJXUmddUkv5
	84d/peWg==;
Received: from ip6-localhost ([::1]:42526 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lJcc5-004dg7-SW; Tue, 09 Mar 2021 13:41:29 +0000
Received: from smtp1.axis.com ([195.60.68.17]:26405) 
 by hr1.samba.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim) id 1lJcby-004dg0-8H
 for samba-technical@lists.samba.org; Tue, 09 Mar 2021 13:41:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=axis.com; q=dns/txt; s=axis-central1; t=1615297282;
 x=1646833282; h=date:from:to:cc:subject:message-id:references:
 mime-version:in-reply-to;
 bh=IX5Ccrifhwn+TfdveaPZcVPwzE7RzbHoY8Z21/LsAAI=;
 b=miSvVThsuF3dhGhWttpB1iSf+qb/SGVrrgayc83ZsPYRVaJhhSpVtCcc
 8lcmBHprar6M0ODfHIt3mH85sar7NVZDDuG4lWZYJnBgNMYuu4vWQ/EBB
 JiU76L4/GvfHvnDKz22u8S1JbnnXBwHAp0XYg5r/sc8c/3H0gR4Zsdz6w
 SR/Tk2zTtozBmUEnztoovIEcE0Rx3i7OyL7dQOvq42uh46Mtd2M63OLVW
 k0P6pGTQpX7pqbEQba5ypdONQdR/TMjrXN1QTbrZuCb7O8PCuYwgEn52U
 77apA3jGhcCaWmNN/uq8thALuHX55Mu63uGj0hjHTTVd30R4nHp1jtjxx Q==;
Date: Tue, 9 Mar 2021 14:41:18 +0100
To: ronnie sahlberg <ronniesahlberg@gmail.com>
Subject: Re: [PATCH] CIFS: Prevent error log on spurious oplock break
Message-ID: <20210309134118.GA31041@axis.com>
References: <20210305094107.13743-1-vincent.whitchurch@axis.com>
 <CANT5p=rB2=DvjtpmVy803emWpuzsy-C2+d4wqQ5g_9fJ8+a5Cw@mail.gmail.com>
 <CAN05THQtb5RY2ye7nkyWBjrXS+=usZCxUM7jBQG+JEpg_TQQTA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAN05THQtb5RY2ye7nkyWBjrXS+=usZCxUM7jBQG+JEpg_TQQTA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
From: Vincent Whitchurch via samba-technical <samba-technical@lists.samba.org>
Reply-To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: Shyam Prasad N <nspmangalore@gmail.com>, CIFS <linux-cifs@vger.kernel.org>,
 samba-technical <samba-technical@lists.samba.org>,
 LKML <linux-kernel@vger.kernel.org>, Steve French <sfrench@samba.org>,
 kernel <kernel@axis.com>, Pavel Shilovsky <pshilov@microsoft.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Mar 09, 2021 at 01:05:11AM +0100, ronnie sahlberg wrote:
> On Sun, Mar 7, 2021 at 8:52 PM Shyam Prasad N via samba-technical
> <samba-technical@lists.samba.org> wrote:
> > The reason for rejecting the request maybe a number of things like:
> > corrupted request, stale request (for some old session), or for a
> > wrong handle.
> > I don't think we should treat any of these cases as a success.
> 
> I agree with Shyam here.
> We shouldn't change the return value to pretend success just to
> suppress a warning.

Thank you all for your comments.  I see that everyone agrees that the
error print is useful for SMB2, so I will drop this patch.

> However, if it is common to trigger with false positives we might want
> to something to prevent it from
> spamming the logs.
> These messages could be useful if we encounter bugs in our leasing
> code, or bugs in server
> lease code, so we should't throw them away completely. But if false
> positives are common ...
> 
> Some thoughts I and Stever brainstormed about could be to change the code in the
> demiltiplex thread where we currently dump the packets that were "invalid"
> to maybe:
> *  log once as VFS and then log any future ones as FYI
> * log once as VFS and then only make the others available via dynamic
> trace points
> * rate limit it so we only log it once every n minutes?  (this is overkill?)

Thank you for the suggestions.  In my case, I've only received some
reports of this error being emitted very rarely (couple of times a month
in our stability tests).  Right now it looks like the problem may only
be with a particular NAS, and we're looking into triggering oplock
breaks more often and catching the problem with some more logging.

