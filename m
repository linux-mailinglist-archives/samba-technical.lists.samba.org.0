Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 9786E36E3A9
	for <lists+samba-technical@lfdr.de>; Thu, 29 Apr 2021 05:22:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:To:Subject;
	bh=1pzdMsgD1wZgDzYjgJnAIkcS4Sm3lCM1+wtVM8/MxQU=; b=UIeTa+EoPUoa7a3xe9Ohx14DxT
	lYZvy02Ze2Jm0T+oCwL25Q20ILPf6t/CPvN1aiZLi7VvUbVUGqP7rnYDOwZ7JWyctKsSkq9Xm0REn
	WxfsYCT3iE2NPvx1j/Naig34GGqvCTdGirjg7ZzXhHAv0n43hPnyKfwa2j+UFVdUdSboE/wTkVl6Y
	7Fys0qH2kH+GntRFs2aGLP+2exyg3DBGWo3Yg48dqOsgfA2v5b1NGsoAZ8H2lGRSe6cXrGKRpYo7t
	Baf9cTaqqllu2YwJ0KTDpDZjYm7/LdtHiiWSHSxMvKGqzNV4mUP8CFSPoo9Pj1srnUse+HysIGB7Q
	kXyx4oZQ==;
Received: from ip6-localhost ([::1]:60276 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lbxFJ-00CyFG-13; Thu, 29 Apr 2021 03:21:45 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:42296) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbxFC-00CyF9-Qj
 for samba-technical@lists.samba.org; Thu, 29 Apr 2021 03:21:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Date:Cc:To:From:Message-ID;
 bh=1pzdMsgD1wZgDzYjgJnAIkcS4Sm3lCM1+wtVM8/MxQU=; b=VfpQ9JrQSJ/uIyhpKxb7nFduIK
 vFYprbP+nCcVB1j+ikyLPQtaZ//0TaARNtBnn+5549T/uW2myKE+2hG+sABCMQcppokypZyg4B4v2
 w68VSNWZ2WZyiYCV0iL+0D+SbsOqIBMc9f2JNGOAhj7XHVQPlOM2MOKhlvWlVxpMEPA2fjoAGIz81
 S+7tbP1sohYI8eooHHd+UjGkKfELboo02+NLNF/iLpi06BJZAcanItJyQGkHhlieLKbXAlE0+XR41
 JMvoGMP5TnBjE8zbRaYhdVX2C21+4pENMb8KZZhLjmHdE5kVnKRY7kryTZOK51GmibL+woSxgg1tA
 e6+mwF0RcByU5dx4ve0gQPzxxnfDBB94TfjwRmKCNGx1EqoR3xjqLDVbIu5+d66C/cHQIdryHXq+k
 87lborD5FgLsXa1S3o55tVGu+Pzr+TT/TgO3+byItT/VjbPu/L3074Q0iHU/zEs/FlN0XsqhXw0qS
 E/c1eYZHQwLjsL75UeWiOI1o;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lbxF9-0005rf-MX; Thu, 29 Apr 2021 03:21:36 +0000
Message-ID: <c51b331fb02f5fa91557646676e4c7cb48397515.camel@samba.org>
Subject: Replace gse_krb5 with gensec_gssapi for all our client code and,
 loadparm consolidation?
To: asn@samba.org
Date: Thu, 29 Apr 2021 15:21:31 +1200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

G'Day Andreas,

I've looked with great interest on your patches to unify our command
line handling, and love the way the credentials system is being
connected up everywhere.  It really brings a joy to me because I've
long hoped for what you are now building.

One area where the credentials code is not able to be used to the full
extent right now is in kerberos with an existing credentials cache,
because the gse_krb5 code still polls for a username and password
explicitly.  Yes, it can use a ccache, but only via a server-wide
enviroment variable, not via the cli_credentials mechansim.

So I wanted to suggest that we update auth_generic_client_prepare to
use gensec_gssapi rather than gse_krb5.  This would use the code that
already has a full connection between the cli_credentials layer and the
GSS credentials layer.

Most of the special case code in gse_krb5 is on the server side
(handling keytabs for the various keytab arrangements permitted on the
file serve) so this shouldn't be a big change, but would mean we use
the command-line specified ccache better.

Anyway, just wanted to let you know.

Finally, take a look at this idea sometime:
https://gitlab.com/samba-team/devel/samba/-/commits/abartlet/use-s3-loadparm-for-global-python-loadparm

For most of Samba, we pass down the cmdline_credentials (s4) or use the
globals (s3).  

In python we do something similar, but often referring back to a magic
global S4-style Loadparm object. 

It is currently a real pain use python code that is s3 based (eg the
libsmb library) as you have to init an s3 loadparm otherwise is breaks
horribly.

As we work harder not to duplicate existing good code I came up with
the approach that if we are going to have a global, it should be an s3
loadparm instance, wrapped up.  That way things like '-d3' on the
command line can still work.

The same could be done on the C side with your command-line work, which
might help further unify things.

Andrew Bartlett
-- 
Andrew Bartlett (he/him)       https://samba.org/~abartlet/
Samba Team Member (since 2001) https://samba.org
Samba Team Lead, Catalyst IT   https://catalyst.net.nz/services/samba

Samba Development and Support, Catalyst IT - Expert Open Source
Solutions






