Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A358D26D7
	for <lists+samba-technical@lfdr.de>; Thu, 10 Oct 2019 11:58:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=+xm2MikDIQfDnPdZTM2kIaCOVb3TpwfaBTFJ88V9940=; b=cuuqR8Mr+CMZwPiZM4mnQCn4uQ
	fzfn6Nj04NaM/SbPvH9zYDyxlrbtCkqUhw0R3QyQaevAtcmsutWDtOeQgORnP17WXIhhkM1bAkmrD
	MWPkjP0XmrMv1WAGZp64aZVQCuNVRjeb0zcezCU0FhbA4ApN32yqlGCGVrbFRqmRo4OaYnvUoZ/i9
	zbeRGS2s7W3WZW3lS4K2O6umM7XBi1B2P88bQ9lmDXwDgb7tKzR1TlSXOLOanaQROWR4uVRe7LOuM
	h9DKTdGXKuMLd2uvjXpheNi292QcwIBybDCaC72PxlZfHApuKDAoCAz+mkxq8cMaV85LhkRvZ34OC
	agHo4icw==;
Received: from localhost ([::1]:63962 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iIVDD-002blF-So; Thu, 10 Oct 2019 09:58:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12908) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIVD8-002bl8-Vd
 for samba-technical@lists.samba.org; Thu, 10 Oct 2019 09:58:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=+xm2MikDIQfDnPdZTM2kIaCOVb3TpwfaBTFJ88V9940=; b=nt1KZyw30VtUTVODoi3Im6LNev
 e0+Js91wnDUVAIT7PMCv8TkFEhi7LAY1Ww5bSMKkTfhwXZ+BsIQovuXyINHLXJZNVvX2kH1W7tUUo
 rsXLOKwFJ6X+czFLQgyv8Tjz6963nfJ58NBhw8bXhdhyeN0CHcKm+i9q3Fikj9jsk+OcibhKu7hu6
 7MOV+X7/5So2uNeLp2W+xDfxfL5LFNMltLVl4gMOQDE5kF27UOeM3iMhQjAc1nBwxz519uJXiWUqz
 aN46LBDE1HeG7viXVbEKewJGnk8DKO2vdyHqI2TRbEqT9GKOfClO4ICZTRLPuoq40DDZsW7WjU91h
 vkFcoQ2W8V6w3LtSXcDJRo+RXrwfhGtNALPSpkARGc95RZJOue+MsPWu5MF3RO8TxfDMazHumuoOt
 Ch33FcU60Qj8s95jU6be/uO5GyeDkQa8ayoTf0ktJbhODxm9sQNmyG1IkDO73J48j4E0nFTMknolo
 uyYH+/jbIgA6rqFdD40/nnlD;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iIVD8-00015X-DL; Thu, 10 Oct 2019 09:58:18 +0000
Date: Thu, 10 Oct 2019 12:58:15 +0300
To: Denis Cardon <dcardon@tranquil.it>
Subject: Re: samba-ad bind-dlz AXFR allow bug
Message-ID: <20191010095815.GP5765@onega.vda.li>
References: <bf8c6483-ad14-9a72-0c66-aae6193a22c9@tranquil.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <bf8c6483-ad14-9a72-0c66-aae6193a22c9@tranquil.it>
User-Agent: Mutt/1.12.1 (2019-06-15)
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
From: Alexander Bokovoy via samba-technical <samba-technical@lists.samba.org>
Reply-To: Alexander Bokovoy <ab@samba.org>
Cc: samba-technical@lists.samba.org
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On to, 10 loka 2019, Denis Cardon via samba-technical wrote:
> Hi everyone,
> 
> I have been looking yesterday into the AXFR bug in Samba Bind-DLZ module[1]
> (current Samba DLZ module accepts DNS zone transfer requests from anybody).
> 
> There has been a fix proposed by Julien Ropé [2]. The patch does work as
> expected (I have not looked into at why the pipeline did not go through).
> 
> However while fixing this bug Julien stumbled on a isc-bind bug [3], which
> resulted in a new patch [4] which was considered as a potential security
> issue by the Bind9 team (CVE-2019-6465).
> 
> This fix is part of Bind9 version 9.11.5 or later. However CentOS7 ships
> version 9.11.4 with a patchset released this summer [5] which address a
> series of bugs and security issues, but it is missing CVE-2019-6465n even
> though the patch was already released at that time. According to Redhat
> errata dated from February it was planned to be included in future bind9
> release [6].
> 
> Redhat does not ship Samba-AD, so there is no issues here with Samba
> Bind-DLZ module as far as Redhat is concerned, however this issue also
> affects other DLZ modules.
> 
> Do you all think this patch [4] may be going in upstream Redhat7/CentOS7 rpm
> in the near future? If I ask customers with active subscriptions to report
> this issue, would it be quicker to be fixed?

The patch is already included into next minor RHEL 7 release plan.

Packages are done and ready for inclusion but it doesn't mean there is
an easy way to get them shipped in an earlier release.

Any RHEL customer with active subscription may ask for a hotfix and for a
asynchronous z-stream update to get them earlier. Perhaps, you can
propose that?

> 
> Adding the patch to the bind9 srcrpm is not very complicated, however I am
> not eager to ship patched rpm of bind9 along Samba packages for such a small
> patch... Another option would be to just remove the AXFR altogether in the
> samba bind-dlz module from our CentOS rpms for the time being...
> 
> Cheers,
> 
> Denis
> 
> [1] https://bugzilla.samba.org/show_bug.cgi?id=9634
> [2] https://gitlab.com/samba-team/samba/merge_requests/169#note_194230102
> [3] https://gitlab.isc.org/isc-projects/bind9/issues/790
> [4] https://gitlab.isc.org/isc-projects/bind9/commit/a9307de85e147f4756c75d15aa221d2262df7d67
> [5] https://access.redhat.com/errata/RHSA-2019:2057
> [6] https://access.redhat.com/security/cve/cve-2019-6465
> 
> -- 
> Denis Cardon
> Tranquil IT
> 12 avenue Jules Verne (Bat. A)
> 44230 Saint Sébastien sur Loire (FRANCE)
> tel : +33 (0) 240 975 755
> http://www.tranquil.it
> 
> Tranquil IT recrute! https://www.tranquil.it/nous-rejoindre/
> Samba install wiki for Frenchies : https://dev.tranquil.it
> WAPT, software deployment made easy : https://wapt.fr
> 

-- 
/ Alexander Bokovoy

