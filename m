Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E929B5A437D
	for <lists+samba-technical@lfdr.de>; Mon, 29 Aug 2022 09:02:14 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=8nHav887B7rtd7YfsewbcaST7KWDf5OTDCmuzDY9J9M=; b=cQoCJzfNWQwVg4NT3SCxavpJ6U
	iNBEzCRYmZ+wcLia8bxY/LnO00Zckr2ZJlkRMRMLqB1r3hbdoe0bhjsdyfcnNjDIRmo9suyOj+heu
	hyVPRZ+WHNoHJFpwgMdUq/aAAMgsWnYVAJF7rb2aUystRWcLdt8MLExbwLUHP/u00DM8cnYKjhGok
	skmrTxm8wRr/imgJy63PWazA4qcuYgXA6axDe+HFyhgZD43ObEAslnp5JXzQ1o6mMRWxuuStP/e7l
	g3k0nbfWHxPyQttwwrbtJBgHGj1N4wBTLljx22Pe/XtUoGW8K2Vs1nBWWfWy+72Is8S/3k4EVUsRa
	qxfEGxjg==;
Received: from ip6-localhost ([::1]:62364 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1oSYlv-002nGM-5L; Mon, 29 Aug 2022 07:01:23 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26998) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1oSYlg-002nGC-5p
 for samba-technical@lists.samba.org; Mon, 29 Aug 2022 07:01:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=8nHav887B7rtd7YfsewbcaST7KWDf5OTDCmuzDY9J9M=; b=QDuOiymcinuY5P6PVNZwbH0Wh1
 vsSTZra2/WHCD7QWOHxo1SkA/EXp3ahdt4d0iX2Aawb5dKrj5MXh45y1MyjGWmfLcfOq81L06iFgM
 GMky3iCmY3EBTSVqVcQ+AayRO2BlTwhXGUpQWlt/4YrDvxXWkRXqz5ODqhTjbQIUXOd7+3AlZmyZp
 wHey6z+ITigHiKOCpit19yQ/d+kszzNWJfprx5Nshpb/Jnkga/fMyt5fETWtk+BG7te4h1CY9xAoF
 EqOtG5n0Eoi6DRRG3BeqXZ/+COU49PLTqVOefVXneWxEJnQtfA3TWy2k1KVzDy07LBfWWWOXMSNXU
 rtFmoroUkCE3fyCdDyKEkg6aRXRREZmp1GSDXL2TJb27UQtvFoREGgH81pYIJSEru0IOUAkMPzAwG
 GwljUCs9TN6QPr1YThQY2evJZOwYu0xiJZ2E+0YsAcmGVdTG+2ZK1PPR+6j/GAhKOPnct/roVrDVH
 xlKqdiXjZbKcQKb/8RUIqGcP;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__ECDSA_SECP256R1_SHA256__CHACHA20_POLY1305:256)
 (Exim) id 1oSYle-002BdV-7V; Mon, 29 Aug 2022 07:01:06 +0000
To: samba-technical@lists.samba.org
Subject: Re: Samba and ShellCheck
Date: Mon, 29 Aug 2022 09:01:05 +0200
Message-ID: <5601373.DvuYhMxLoT@magrathea>
In-Reply-To: <20220823180243.565f35e2@martins.ozlabs.org>
References: <4766256.31r3eYUQgx@magrathea>
 <20220823180243.565f35e2@martins.ozlabs.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
From: Andreas Schneider via samba-technical <samba-technical@lists.samba.org>
Reply-To: Andreas Schneider <asn@samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tuesday, 23 August 2022 10:02:43 CEST Martin Schwenke via samba-technical 
wrote:
> Hi Andreas,
> 
> On Tue, 23 Aug 2022 07:50:24 +0200, Andreas Schneider via
> 
> samba-technical <samba-technical@lists.samba.org> wrote:
> > for Samba master we have ShellCheck with error level in place now. It will
> > check that our scripts are error free!
> 
> Yay!
> 
> That probably isn't true for CTDB, but we are gradually improving things.
> 
> > The next step would be to move ShellCheck to warning level and this will
> > be
> > quite some work.
> 
> Yep!
> 
> > But first we need to discuss something.
> > 
> > If I run ShellCheck in warning level:
> > 
> > ./script/check-shell-scripts.sh $(pwd) warning
> > 
> > The warning I see most of the time is:
> > 
> > warning: In POSIX sh, 'local' is undefined. [SC3043]
> 
> This is why I never use local in /bin/sh scripts.  It has never made it
> into POSIX.  I suspect the reason is that different shells implemented
> different semantics.  For example:
> 
>   local foo=$(example --command)
> 
> I think local in bash eats the exit code of the subshell.  Other shells
> may implement it differently.
> 
> I use an "excellent" convention for local variables in /bin/sh scripts,
> specially designed to reduce readability.  ;-)  I prefix any local
> variable with '_'.  However, it makes no semantic difference, it just
> acts as a hint.

Either we convert everything to this convention or we disable the shellcheck 
warning in those scripts. What do you prefer?

./script/check-shell-scripts.sh $(pwd) warning >shell.log 2>&1


Example to disable the warning:


 ctdb/tests/run_tests.sh | 1 +
 1 file changed, 1 insertion(+)

diff --git a/ctdb/tests/run_tests.sh b/ctdb/tests/run_tests.sh
index ff431f8831f..12e495e3dc0 100755
--- a/ctdb/tests/run_tests.sh
+++ b/ctdb/tests/run_tests.sh
@@ -1,4 +1,5 @@
 #!/usr/bin/env bash
+# shellcheck disable=SC3043
 
 usage() {
     cat <<EOF



-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



