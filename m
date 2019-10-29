Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id E686CE93B9
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 00:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=Uzo7IugC/7RMwsSOp68I2uQRbufQTgfg0AIBCMLyhWM=; b=rde4Nj6+IEd55o+NTjQMgiG65g
	lRMpWmBaDJb5SeH5qq+P3td0REtU5n/fS9oAbbOuHVpWmwVbQk9s3M2hTFDcmWR2ldvp5gXPfKMbB
	q2YtoFyTsB1wdLQTNt3MAWTmiwHNy341E2GzCbcDs9mtXFPa04onFUOypjKV4dk7z34aop+P44/4M
	ezBWLyqx1OUhgxuR94GoNykZNmrHbg+BIJw24oGJQG2R4nvqJmYYwRSKQ1BZIBVbuX57cuqecECZJ
	7E0lLNyziBtpsMTLszxWBuX133mgqeRkNnUjfuFRK6scd2eGB7sRgIJde45WoNnj86GjWdU83IC1b
	yLN4GPRw==;
Received: from localhost ([::1]:35330 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPayN-003UWC-Un; Tue, 29 Oct 2019 23:32:24 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:26624) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPayJ-003UW5-Fl
 for samba-technical@lists.samba.org; Tue, 29 Oct 2019 23:32:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Cc:To:From:Date;
 bh=Uzo7IugC/7RMwsSOp68I2uQRbufQTgfg0AIBCMLyhWM=; b=sLhYkoV67kcsFIEwM6V2v1ECjo
 wvNYkDJvJ/O43Er4KzdCV36OqYTXgayRJYIhTCA1zcY2mSitMNxmfHqEtoWtDlXxGrk1WtBQN/lql
 ehqTPh7ymEzxlCp/U7aik11YDJFko8Z91yh66cKS/LRf9J5TC22jJoUeByfO+U2xBgs1oTR3qidNw
 w65wWHZJGiB94WG1Bq0fWOSgFtY7DYZddWqBpRBwGYJkjs130KcwMshDvDPPTwaQR4yqEAP4PCJJd
 sxl94I+3PDKhlj6W2gKRCwWRxkFsGp2Mzuvssf2vbPd3fzBRHS0g1TsWPaVxUE4Vb20CHpRsTjUCP
 P5grUa1aRK/k8sEX5whXcpafv1e25jFLNGtbQRfbFYEM6QDtOtTFDwa5K6S1Gy4k4fdkGTNUS2tBH
 OEmJJfz2q8rfDljwckohOVykE1DYetoFnwq/tTcuGCeIkQ03f1d85JApqulsVPjvyrDbd4LX/83Oq
 4wdF01B1X4PKqHgINJcm2Gco;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iPayI-0003az-LL; Tue, 29 Oct 2019 23:32:19 +0000
Date: Tue, 29 Oct 2019 16:32:16 -0700
To: Uri Simchoni <uri@samba.org>
Subject: Re: Q: how to build with system Heimdal
Message-ID: <20191029233215.GA22880@samba.org>
References: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
 <20191029171833.GA13244@samba.org>
 <5d738a0a-13c5-7ac0-4cc4-3aa6e6c81627@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d738a0a-13c5-7ac0-4cc4-3aa6e6c81627@samba.org>
User-Agent: Mutt/1.5.21 (2010-09-15)
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
From: Christof Schmitt via samba-technical <samba-technical@lists.samba.org>
Reply-To: Christof Schmitt <cs@samba.org>
Cc: samba-technical <samba-technical@lists.samba.org>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 29, 2019 at 08:06:42PM +0200, Uri Simchoni wrote:
> On 29/10/2019 19:18, Christof Schmitt wrote:
> >On Fri, Oct 25, 2019 at 12:33:33AM +0300, Uri Simchoni via samba-technical wrote:
> >>Hi,
> >>
> >>How should I build Samba with system heimdal? Should this do the trick:
> >>./configure --with-system-heimdalkrb5 --without-ad-dc
> >>make
> >>
> >>(assuming I have Heimdal installed, of course)
> >>
> >>I tried this one on master, configure succeeds and the build fails
> >>like so (kind of surprising that it tries building system heimdal):
> >>
> >>waf: Entering directory `/home/vagrant/samba/bin/default'
> >>         Selected system Heimdal build
> >>[190/192] Compiling source4/heimdal/lib/vers/print_version.c
> >>21:26:51 runner ['/usr/bin/gcc', '-D_SAMBA_BUILD_=4',
> >>'-DHAVE_CONFIG_H=1', '-MMD', '-D_GNU_SOURCE=1',
> >>'-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-fPIC',
> >>'-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT',
> >>'-fstack-protector-strong',
> >>'-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL',
> >>'-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void
> >>__HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)',
> >>'-Isource4/heimdal_build', '-I../../source4/heimdal_build',
> >>'-Iinclude/public', '-I../../include/public', '-Isource4',
> >>'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
> >>'-I../../source4/lib', '-Isource4/include',
> >>'-I../../source4/include', '-Iinclude', '-I../../include',
> >>'-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..',
> >>'../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/vagrant/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
> >>In file included from ../../source4/heimdal_build/roken.h:156:0,
> >>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> >>../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error:
> >>roken-common.h: No such file or directory
> >>  #include <roken-common.h>
> >>           ^~~~~~~~~~~~~~~~
> >>compilation terminated.
> >
> >This should work, but it broke back with Samba 4.10. The build works
> >with Samba 4.9. I am trying to bisect and debug this problem now.
> >
> >Christof
> >
> 
> Oh, thanks! I didn't want to start actually debugging this before
> being sure I'm not missing some basic thing. Do note however that
> all of waf has been replaced for 4.10, so maybe it's more a matter
> of getting this back in shape than bisecting.
> 
> I wanted to push forward another cross-compilation patch that
> involves removal of an explicit path of Heimdal headers, so I wanted
> to see if that breaks system-heimdal build and then realized it's
> broken before the patch.

So far it looks like the problem is that the heimdal include files are
in /usr/include/heimdal (at least in the Ubuntu 18.04 that i am using
for debugging).

Deleting source4/heimdal_build/krb5-types.h and adding this line allows
the system heimdal build to succeed:

--- a/wscript_configure_system_heimdal
+++ b/wscript_configure_system_heimdal
@@ -18,6 +18,7 @@ if krb5_config:
             elif l.startswith("includedir="):
                 include_path = l.strip()[len("includedir="):]
                 heimdal_includedirs.append(include_path)
+                conf.ADD_EXTRA_INCLUDES(include_path)
                 conf.define('HEIMDAL_KRB5_TYPES_PATH',
                             include_path + "/krb5-types.h")
     finally:

I am not sure if that is the cleanest solution, maybe someone with more
knowledge about waf and the build could provide input.

I have not done further testing. Building with the internal heimdal
library and MIT would be the next steps. Ideally we would also establish
a system heimdal build in gitlab.

Christof

