Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 4452B2A3047
	for <lists+samba-technical@lfdr.de>; Mon,  2 Nov 2020 17:51:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=9QgN3QcEUXOsh44yvRQ00iPWI+jcBkofTPS9Bmm4SHM=; b=jq6221POa3adJiLE24ueYhqGqp
	kYvUhb5SLdmux5W1lhpD5dywTXgIQ3PV8u8RXrSZrTFbTyUf4GyBIwH0Lm2nygUJrwYMSGsk/K4Al
	1OBK14qPFiqNflfahkotWaoilSsa4Yj7DMI6926XJ4Udrr+8ErTnAihULhq99/yweIaaJLFh+y8QB
	vlBxDQOGRHIBwa4evS090moLW4qb9iSFxODpvA/nFwpL0nIznhaJ9t77RIP/IA+VzMpO5THT73OZl
	O3e77YkLl90l9ZZPrTnKcgdwnVTisWF3kC/OD95i3cP+ZaJtzBvi1+2ZgHs6bvwX/KedcDWNRLwqr
	n5RDevvw==;
Received: from ip6-localhost ([::1]:60146 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1kZd3E-00H0Ic-JL; Mon, 02 Nov 2020 16:51:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:27872) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kZd3A-00H0IV-2n
 for samba-technical@lists.samba.org; Mon, 02 Nov 2020 16:51:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=9QgN3QcEUXOsh44yvRQ00iPWI+jcBkofTPS9Bmm4SHM=; b=1Gy0UCvShfeiu81rg0rHCsHtUS
 SV6nbG5ooc9/YNfF3cdqsvxr0rOvnbsvJof1zKTSHYeCIpwADB0SUBj6nulY3ezlcMR72zxMxaeOE
 GqItaDdd/zpeVH8grdyLH0Bel6zyZsNMJKaXgddOqZNCQj4yRXdLLppZXr4Clh/ZQe3OvrdgU7SpX
 Quj/l2DZ9HaiMsI0HLpop6HUCqD21dH2lWlS9IxC8TEA5WmmMGlCkA/6N7VshbSWfqXvmdkml1Mm+
 x8QUmYSJBus6NNrwdx1g+CSPRqsNNytmGtJS3kG0s5ujCKLGX8Cslahs539yGyEpWbqyFQT5KDFXG
 x6SeXldPVeiE98Drau43KWJkLhf+sQ33Etyi+ab0jDauDRLcNjrBrxsI8izjt31i660IblW1/oN9M
 8SrhMaKLLDFK5h2l02DY7FdZHEkyyy2AoBI8DSwqX4/5VAnXB3PWGz9Dop4Cmf1bVewpJaesE/+RE
 AsWtFadIJcs1A1hhSPVz1DBD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1kZd36-00008K-PZ; Mon, 02 Nov 2020 16:51:17 +0000
Date: Mon, 2 Nov 2020 08:51:14 -0800
To: Xiaoli Feng <xifeng@redhat.com>
Subject: Re: can't start smbd after install samba posix branch
Message-ID: <20201102165114.GC2135443@jeremy-acer>
References: <20262379.55437477.1603985286601.JavaMail.zimbra@redhat.com>
 <57860C29B41C41148C728C7F08BD12FC@rotterdam.bazuin.nl>
 <1282344879.55505050.1604024067212.JavaMail.zimbra@redhat.com>
 <CAN05THRxZ_=o0QnniT4-J365E34nUQxJube7mUQa17Lcj3YzuA@mail.gmail.com>
 <758246149.55514473.1604038831866.JavaMail.zimbra@redhat.com>
 <47e9f3cf-e258-f441-76d5-4e72b4073031@samba.org>
 <2038917775.55518004.1604044565533.JavaMail.zimbra@redhat.com>
 <CAH2r5mtbe-D5Cf-qHWWnUhdYaOYtniHcf91ZFXAB6MPV3Znj7Q@mail.gmail.com>
 <259426271.55930473.1604335521173.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <259426271.55930473.1604335521173.JavaMail.zimbra@redhat.com>
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
Cc: Steve French <smfrench@gmail.com>,
 samba-technical <samba-technical@lists.samba.org>, belle@samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Mon, Nov 02, 2020 at 11:45:21AM -0500, Xiaoli Feng via samba-technical wrote:
> Hi,
> 
> ----- Original Message -----
> > From: "Steve French via samba-technical" <samba-technical@lists.samba.org>
> > To: "Xiaoli Feng" <xifeng@redhat.com>
> > Cc: "samba-technical" <samba-technical@lists.samba.org>, belle@samba.org
> > Sent: Saturday, October 31, 2020 12:29:55 AM
> > Subject: Re: can't start smbd after install samba posix branch
> > 
> > Looks like you are missing a required smb.conf parameter
> > 
> >               smb2 unix extensions = yes
> 
> Thanks Steve. This fix my problem.

Sorry for the problem. This code changes in this
branch will start to be migrated into mainline Samba
once the VFS rewrite is complete (currently ongoing,
but this is a large job).

