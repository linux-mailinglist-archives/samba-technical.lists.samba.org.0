Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1594B36F821
	for <lists+samba-technical@lfdr.de>; Fri, 30 Apr 2021 11:46:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Date:Subject:To;
	bh=MEVEWz2xFgq+gBmL2qwLb3QUfsd1gA1Gp3Iaq54twE8=; b=V8T5bP1Tl8dbJ8fz/GLYw6cZyn
	DqDS0ltt2y+MPIBTcKabE2q6n9z7qXFr/uXnqkhYjbqjs+ZmSUwb62768gsK9MzB50EqrJnsOr1Is
	1zYq3Iv0GijYDSV4Dl813UQecCt6W/Oy43el4iPJimWe5jbBFD3Lp60vb3Wrt4ljbXb4usxAz4YJm
	/IIIrEmrmej3Edx48SgDto+TPKGMNe3UUE76iDHiVCkLcW5zWTIL/BAyoQtPig4knlGPniyXa+Jxl
	LGyk9cwxqkgAoVfChZs8W0NMIkcl2mH0bmbd2pHNzhPI1Fn5GswK1+844YAauyRZf/f7Lfmb5vxX9
	lu69FFHw==;
Received: from ip6-localhost ([::1]:41260 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1lcPj7-00DIFC-W6; Fri, 30 Apr 2021 09:46:26 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:12848) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcPj2-00DIF5-FA
 for samba-technical@lists.samba.org; Fri, 30 Apr 2021 09:46:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:Cc:To:From;
 bh=MEVEWz2xFgq+gBmL2qwLb3QUfsd1gA1Gp3Iaq54twE8=; b=F5L4qgEakDPdGhMOBxSo0qQ/jd
 bYfnz8yGnlAEuVYgsi7FoZpdBzvrbmyPWDIqYP/F77tfx3X4QtqwYhKmIi4jJdKjC3e4viw20RYSK
 pMRcGyUN/rj+54XEcPBVItD/N468RcXMsyPt0o/B71KtOrsxJqDIBhq/+ovCxn6t0Sq1o1mK70tjX
 XMS4OT17YlLbVx/DtnwabM6THxKl3lE96HRyjJXKgsuiJ10Pbr4DnNXDFQ4x+pi8oYGAuQq02oKVn
 cWpjIszNnkspG+AwZVrTHv9tHZFZ843YMlK0dtQSUjxlsUm9FBMMdMyVtrBPp9x19HaJOv11jc1Qr
 LOavSShIj8LH9so+fWDEw1r7mPChsbpEkpP5kzVXQpJtjHJUuOz1hpkR+ZVCOHGmLQsfKBKmBCiQ8
 epY2iCQAzhnigwo5b+Q7HJDvXcQtXque9Xx0Tza2eM1/3ZLiP+MsGQvu+aAWXIusRGNfiKKVpMPrE
 AUIU90n6+W6FWXVt+cLY75Uu;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1lcPj0-00082q-UT; Fri, 30 Apr 2021 09:46:18 +0000
To: Andrew Bartlett <abartlet@samba.org>
Subject: Re: Replace gse_krb5 with gensec_gssapi for all our client code and,
 loadparm consolidation?
Date: Fri, 30 Apr 2021 11:46:18 +0200
Message-ID: <4858303.TADPx3k1qC@magrathea>
In-Reply-To: <c51b331fb02f5fa91557646676e4c7cb48397515.camel@samba.org>
References: <c51b331fb02f5fa91557646676e4c7cb48397515.camel@samba.org>
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
Cc: Upstream Samba Technical Mailing list <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Thursday, 29 April 2021 05:21:31 CEST Andrew Bartlett wrote:
> G'Day Andreas,

Hi Andrew,
 
> I've looked with great interest on your patches to unify our command
> line handling, and love the way the credentials system is being
> connected up everywhere.  It really brings a joy to me because I've
> long hoped for what you are now building.

the cli_credentials still need a lot of cleanup. There are function which 
should return a bool instead of void.

The machine_account_pending thing quite horrible and we should try to get rid 
of it rather sooner than later.

> One area where the credentials code is not able to be used to the full
> extent right now is in kerberos with an existing credentials cache,
> because the gse_krb5 code still polls for a username and password
> explicitly.  Yes, it can use a ccache, but only via a server-wide
> enviroment variable, not via the cli_credentials mechansim.
> 
> So I wanted to suggest that we update auth_generic_client_prepare to
> use gensec_gssapi rather than gse_krb5.  This would use the code that
> already has a full connection between the cli_credentials layer and the
> GSS credentials layer.

gse_krb5 is only keytab handling. I think you mean just gse ;-) However I'm 
not sure if both implementations have the same feature set, but our tests 
should reveal that.

> Finally, take a look at this idea sometime:
> https://gitlab.com/samba-team/devel/samba/-/commits/abartlet/use-s3-loadparm
> -for-global-python-loadparm
> 
> For most of Samba, we pass down the cmdline_credentials (s4) or use the
> globals (s3).
> 
> In python we do something similar, but often referring back to a magic
> global S4-style Loadparm object.
> 
> It is currently a real pain use python code that is s3 based (eg the
> libsmb library) as you have to init an s3 loadparm otherwise is breaks
> horribly.
> 
> As we work harder not to duplicate existing good code I came up with
> the approach that if we are going to have a global, it should be an s3
> loadparm instance, wrapped up.  That way things like '-d3' on the
> command line can still work.
> 
> The same could be done on the C side with your command-line work, which
> might help further unify things.

The best would be to have just one loadparm implementation.



Cheers


	Andreas

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D



