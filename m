Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 66F74EA6B0
	for <lists+samba-technical@lfdr.de>; Wed, 30 Oct 2019 23:50:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Subject:To:Date:cc;
	bh=7E2YUHOw7nxZvE6pUiJESluA/K5qWOWJkifcgDWgLlk=; b=OcWSxTEpNsMBXzh4qT/oNp/1ji
	h9yUAdhbd+OQjKDDm/TDWaQTGQpojz+Id5sZAg/GTBG9Wcw6WOVeYiumqXC+BrtsKQwL5Rvy6X0Q9
	swgwArY94FDi/BmopRyxuL3Ivryue++7n3w7VvtzZlZoBrLDnhoYbzGFlTUllanWk07Suu+S9mt1q
	e5FT5zVUDSWmuJ9hG38J8p9hZh9cMb2ImOSYRWUoO0TqTffJ+MIUj5PcO2S9dpsE9dOMt+n52JjSn
	p2SdHLUvGeRuYYvL3MVDZJr9MVsnvj+pLbHH+dbQ+pLJLBT032dCWbm135VZ4sFUf36mxLIbGbREC
	OCV59k7w==;
Received: from localhost ([::1]:48234 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1iPwnD-003qci-NZ; Wed, 30 Oct 2019 22:50:19 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:16402) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1iPwn0-003qcb-Bd
 for samba-technical@lists.samba.org; Wed, 30 Oct 2019 22:50:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:To:From:Date:CC;
 bh=7E2YUHOw7nxZvE6pUiJESluA/K5qWOWJkifcgDWgLlk=; b=kibsiHq4fsErb8diKgk2EawYdP
 FJcnwqkjoglSbUtmbor9tSlqtoX5nRJznbGqyF1kwlRhgm0EnnjhxEXRRQEtUTkuZrMIgw6i9dGK1
 L5AFnXXNW9iWGAHyFiCvGQFJ/50gScmWfzWOZs7Zm7J72euh2iNb+zn2uoKJKIflQ4fYUgUOAKSTm
 Lmh7xdN5EopM8iyuI7RYkatfB+V8msRUnHSwFTSQoa+yJSDCsL9CcXrg4YkVR0MjxJ9i96oWr5Owh
 LJzE88mSk+gXT8vIENUeNRKvxvid7hRJlJzHopf+oXxqV3o0J1+NbrlCArsDyp4HYhC/mYm4HdeAE
 m1JvQgTMckaWFR3ijGR7VGL4k9R/00iDVnyzrrDxqCfr7wPHLs6PXAQZs5kzo3x390LJ2zeETXTzM
 gNxgexlcIBpwp4djByulQK6oYrwr8nU88fUmF2/jUjoXDdihfOoA3jgSHw8xgaBWGdZWq4M7cFVfJ
 es0nca7qFCmuLNGhZemPCI+1;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.2:ECDHE_ECDSA_AES_256_GCM_SHA384:256)
 (Exim) id 1iPwmz-0007SC-Eu; Wed, 30 Oct 2019 22:50:05 +0000
Date: Wed, 30 Oct 2019 15:50:02 -0700
To: Uri Simchoni <uri@samba.org>,
 samba-technical <samba-technical@lists.samba.org>
Subject: Re: Q: how to build with system Heimdal
Message-ID: <20191030225002.GA9786@samba.org>
References: <07c7a4cf-b874-d9ae-ce9f-909345b27265@samba.org>
 <20191029171833.GA13244@samba.org>
 <5d738a0a-13c5-7ac0-4cc4-3aa6e6c81627@samba.org>
 <20191029233215.GA22880@samba.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191029233215.GA22880@samba.org>
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
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

On Tue, Oct 29, 2019 at 04:32:16PM -0700, Christof Schmitt via samba-technical wrote:
> On Tue, Oct 29, 2019 at 08:06:42PM +0200, Uri Simchoni wrote:
> > On 29/10/2019 19:18, Christof Schmitt wrote:
> > >On Fri, Oct 25, 2019 at 12:33:33AM +0300, Uri Simchoni via samba-technical wrote:
> > >>Hi,
> > >>
> > >>How should I build Samba with system heimdal? Should this do the trick:
> > >>./configure --with-system-heimdalkrb5 --without-ad-dc
> > >>make
> > >>
> > >>(assuming I have Heimdal installed, of course)
> > >>
> > >>I tried this one on master, configure succeeds and the build fails
> > >>like so (kind of surprising that it tries building system heimdal):
> > >>
> > >>waf: Entering directory `/home/vagrant/samba/bin/default'
> > >>         Selected system Heimdal build
> > >>[190/192] Compiling source4/heimdal/lib/vers/print_version.c
> > >>21:26:51 runner ['/usr/bin/gcc', '-D_SAMBA_BUILD_=4',
> > >>'-DHAVE_CONFIG_H=1', '-MMD', '-D_GNU_SOURCE=1',
> > >>'-D_XOPEN_SOURCE_EXTENDED=1', '-DHAVE_CONFIG_H=1', '-fPIC',
> > >>'-D__STDC_WANT_LIB_EXT1__=1', '-D_REENTRANT',
> > >>'-fstack-protector-strong',
> > >>'-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES=NULL',
> > >>'-DSTATIC_HEIMDAL_VERS_HOSTCC_MODULES_PROTO=extern void
> > >>__HEIMDAL_VERS_HOSTCC_dummy_module_proto(void)',
> > >>'-Isource4/heimdal_build', '-I../../source4/heimdal_build',
> > >>'-Iinclude/public', '-I../../include/public', '-Isource4',
> > >>'-I../../source4', '-Ilib', '-I../../lib', '-Isource4/lib',
> > >>'-I../../source4/lib', '-Isource4/include',
> > >>'-I../../source4/include', '-Iinclude', '-I../../include',
> > >>'-Ilib/replace', '-I../../lib/replace', '-I.', '-I../..',
> > >>'../../source4/heimdal/lib/vers/print_version.c', '-c', '-o/home/vagrant/samba/bin/default/source4/heimdal/lib/vers/print_version.c.1.o']
> > >>In file included from ../../source4/heimdal_build/roken.h:156:0,
> > >>                  from ../../source4/heimdal/lib/vers/print_version.c:39:
> > >>../../source4/heimdal/lib/roken/roken.h.in:282:10: fatal error:
> > >>roken-common.h: No such file or directory
> > >>  #include <roken-common.h>
> > >>           ^~~~~~~~~~~~~~~~
> > >>compilation terminated.
> > >
> > >This should work, but it broke back with Samba 4.10. The build works
> > >with Samba 4.9. I am trying to bisect and debug this problem now.
> > >
> > >Christof
> > >
> > 
> > Oh, thanks! I didn't want to start actually debugging this before
> > being sure I'm not missing some basic thing. Do note however that
> > all of waf has been replaced for 4.10, so maybe it's more a matter
> > of getting this back in shape than bisecting.
> > 
> > I wanted to push forward another cross-compilation patch that
> > involves removal of an explicit path of Heimdal headers, so I wanted
> > to see if that breaks system-heimdal build and then realized it's
> > broken before the patch.
> 
> So far it looks like the problem is that the heimdal include files are
> in /usr/include/heimdal (at least in the Ubuntu 18.04 that i am using
> for debugging).
> 
> Deleting source4/heimdal_build/krb5-types.h and adding this line allows
> the system heimdal build to succeed:
> 
> --- a/wscript_configure_system_heimdal
> +++ b/wscript_configure_system_heimdal
> @@ -18,6 +18,7 @@ if krb5_config:
>              elif l.startswith("includedir="):
>                  include_path = l.strip()[len("includedir="):]
>                  heimdal_includedirs.append(include_path)
> +                conf.ADD_EXTRA_INCLUDES(include_path)
>                  conf.define('HEIMDAL_KRB5_TYPES_PATH',
>                              include_path + "/krb5-types.h")
>      finally:
> 
> I am not sure if that is the cleanest solution, maybe someone with more
> knowledge about waf and the build could provide input.
> 
> I have not done further testing. Building with the internal heimdal
> library and MIT would be the next steps. Ideally we would also establish
> a system heimdal build in gitlab.

The patches in
https://gitlab.com/samba-team/devel/samba/commits/christofschmitt-bug-14179

fix the build, if you want to give it a try. Now i am trying to get
this running in gitlab and have a problem with the CentOS images.

Christof

