Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B3E740945
	for <lists+samba-technical@lfdr.de>; Wed, 28 Jun 2023 07:34:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=PUqbTYo7UL1zh1w69Rom/85ppbdMuGu9gppLrJkNyjY=; b=aYMhMJ/ToadT27lA3/gv1nL+vA
	QVaXLCSJ72XGTotrBteIf0MtJlk7hDl0SlMeb05AuW8SduMMIBDQ2xgfc9pmtqw3GHIMgGzUpEH5+
	PYoAXWBSVnwhH6iCgkgMC5PINZCv48JdQYs5D67+/zpFMxL5fVoIPkiKe8E4tB2UkkHXMZYvRMNV/
	wHt/UOU9ikERLdYkG+qJMw9vSdueGfrSraj67qz7tORfbJ7+okGg4ZYv9jlygQqp+pU/c2RA5x1ei
	3dpNtxLPt0RVEQ+oR59JlfJ58pXAaKt7N9GGl7fci0YNwkVAX5bd/lTIqcEKAXXcUJoPrVcHuqrGV
	o48gLVSQ==;
Received: from ip6-localhost ([::1]:64484 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1qENo0-004vIO-4C; Wed, 28 Jun 2023 05:33:28 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:52790) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1qENnt-004vIF-P0
 for samba-technical@lists.samba.org; Wed, 28 Jun 2023 05:33:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=PUqbTYo7UL1zh1w69Rom/85ppbdMuGu9gppLrJkNyjY=; b=LMii7O78iSgzcxpX3ejjiTolae
 fVAoB5ToRSWyWJblNePYhPWY2KLkEI8DsP3J0kV7mZko1pnfcOaS0uOvEBLWwRA997oNRzXIRTr/o
 sx0AeowTGDFBA9a2gmEVYE2rDhpskxOm1s2njOFNdT7P8eHGUAHtmmM49/CunblrARlrgTzipNCPF
 PKwYz12Oc19wekQXbqNtTVkI+uxIjtbXhoAymrVo9rr29giVgFS7HVXfUwkv46CdSrs3QM5olS42+
 4djdsQmVse/noEdg3dTAnW7sX7DSSW0NCmcuYJj3NYrP4RgYQIyZBwUM3DMUG4EB6rqIytxfS55rq
 MDymMKnHHYJpFGEMrk5WY08PEPpyqGk3zm/0S2oJ8mIsRFCFkCa+R9LG8nP6Y6HeWrkIAgFcgsRpS
 06oHbtdBpx2b2tSg8npn9ofCmMBaAy/+Vu8oHR30HyEya5llqC12YDqcYTBayXFAbhm26MzojZCBk
 Lt6p6nZiwgv64nOgit6upFPh;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1qENnr-004t1Q-1N; Wed, 28 Jun 2023 05:33:20 +0000
Message-ID: <21696bbbc739934d20fd4198682fd44b63b17d46.camel@samba.org>
Subject: Replication USN semantics around Azure AD Connect
To: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Date: Wed, 28 Jun 2023 17:33:15 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.5-0ubuntu1 
MIME-Version: 1.0
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
Cc: Stefan Metzmacher <metze@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

I've been working to make Azure AD connect work with Samba.

This is working for small domains, but for larger domains we hit a
problem.

Our USN handling in GetNCChanges can sometimes return the same
tmp_hightest_usn, so we have this code:

			/*
			 * We need to make sure that we never return the
			 * same highwatermark within the same replication
			 * cycle more than once. Otherwise we cannot detect
			 * when the client uses an unexptected highwatermark.
			 *
			 * This is a HACK which is needed because our
			 * object ordering is wrong and set tmp_highest_usn
			 * to a value that is higher than what we already
			 * sent to the client (destination dsa).
			 */
			r->out.ctr->ctr6.new_highwatermark.reserved_usn += 1;


To make a new higher USN for this case.

However, Azure AD connect comes back only with the tmp_highest_usn, eg
reserved_usn is always zero.  This means we declare the client-supplied 
highwatermark as being older, and start replication from scratch.  

Starting from zero then means we give the same data, end in the same
place and the client has an infinite loop against us. 

Do you have any clues, other than a revamp of our replication logic, to
fix this both sort-term and to remember for the longer term?

In the meantime I've suggested 'drs max objects sync = 100000' and 'drs
max link sync = 100000' in the smb.conf to avoid multiple chunks.

Thanks for any clues,

Andrew Bartlett

-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead                https://catalyst.net.nz/services/samba
Catalyst.Net Ltd

Proudly developing Samba for Catalyst.Net Ltd - a Catalyst IT group
company

Samba Development and Support: https://catalyst.net.nz/services/samba

Catalyst IT - Expert Open Source Solutions




