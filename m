Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF294DD37F
	for <lists+samba-technical@lfdr.de>; Fri, 18 Mar 2022 04:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=ycfglNP+0APskTFNKTYzMOQg1ooK6i0H/LP9igGUcX0=; b=X26sqKaB3tTyLXb4yZiHtTTfgV
	CCHuAEPYKCXOksnWw0Dov/gDg9Dlx1waDFWvpXvihorN9J9xd7cEMm8vRFHUMpzAxJRvtqdmJr59v
	tldZyyezEwP5t9ZwEcSGlQARIt/7fcr8c29/beobbvy2FZ7McSQ0vl+LM5NUnxTY9SjPydVE3KhhU
	TcQDUcLUQyfGmGOAdDzDild0CwI0YKLdQBBt3hUKe0IGEJmwHWNxiMuqtVjDbAuDRxLj9HvxYEwfA
	XYybyeVc6SzDldL2hvJjvLyguMiZ4v3Pg1HS+Tp8lf2Rs80X39FsqlAP9TCmSA1KRo9/kHdWx4Ik7
	k8taz7MA==;
Received: from ip6-localhost ([::1]:53860 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nV37V-003Phi-0a; Fri, 18 Mar 2022 03:17:41 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:49339
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nV37O-003PhZ-KR
 for samba-technical@lists.samba.org; Fri, 18 Mar 2022 03:17:37 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4KKThY5lcJz4xc1;
 Fri, 18 Mar 2022 14:17:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1647573438;
 bh=ycfglNP+0APskTFNKTYzMOQg1ooK6i0H/LP9igGUcX0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=h5UnBQeb1+9QPtT/jk74dCcEhJn4oyHVr1inHsrdoWZLpYd4AUt/8nREAzoNiRla7
 WT7pQndqgrPtOZCgqzN1+kjk8GtG5w/or7pB5s1sq0HWZjEgNbgcaqYHodAiAjXnB9
 S2N4uxg7PIMupwJuASts8KX4cHN7SdvkGnS5n3Hc2o4YtnAca3mTaW7ACVVIC6dWgl
 9isbAWUXI/o1MQ354WQqSfdexHybK7QvlkWNoDP38KmapPJcloGh2WP/vG+d+PB/8T
 /xE9qC81lUY+lULZtXwCwSQHsOCfT6O0ufWYOgMAgN3BWBqtTkqGMyuGN1VHtRyVgT
 Dgam7EO0kW8Kg==
Date: Fri, 18 Mar 2022 14:17:15 +1100
To: samba-technical@lists.samba.org
Subject: Re: ctdb nfs rquotad: inconsistency between startup and checks
Message-ID: <20220318141715.3c518f6f@martins.ozlabs.org>
In-Reply-To: <CANYNYEFxEs8couhP-v9nZcJVTjHck1OJMZw14Bfxe7nMpMDWNg@mail.gmail.com>
References: <CANYNYEHpqsDONcd24SX3GxdRSX6FPR0BH7Ar9mizqke4Rk2T0Q@mail.gmail.com>
 <20220317112156.3abc7093@martins.ozlabs.org>
 <CANYNYEFxEs8couhP-v9nZcJVTjHck1OJMZw14Bfxe7nMpMDWNg@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Warn: EHLO/HELO not verified: Remote host 2404:9400:2221:ea00::3
 (mail.ozlabs.org) incorrectly presented itself as gandalf.ozlabs.org
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
From: Martin Schwenke via samba-technical <samba-technical@lists.samba.org>
Reply-To: Martin Schwenke <martin@meltin.net>
Cc: Andreas Hasenack <andreas@canonical.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Hi Andreas,

On Thu, 17 Mar 2022 17:23:14 -0300, Andreas Hasenack via
samba-technical <samba-technical@lists.samba.org> wrote:

> On Wed, Mar 16, 2022 at 9:22 PM Martin Schwenke <martin@meltin.net> wrote:
> > However, this doesn't obey the principle of least surprise, and there is
> > a design flaw here. I have overloaded the meaning of variables like
> > nfs_rquotad_service. There is an assumption that an unset variable
> > means it is started elsewhere, which is only really true for Sys-V init.  
> 
> When you say "started elsewhere", do you mean "elsewhere in ctdb", or
> in the installed system?

Oh, I mean that it is started by the old nfs, nfs-kernel-server or
similar init script.  It starts most of the NFS services.

> nfs is complicated, so many services, under so many conditions
> depending on what is used and what isn't.
> 
> Upstream tried to grow some smarts into the systemd service units, and
> many of those start somewhat automatically when needed (like when
> /etc/krb5.keytab is present - which in itself is not 100% correct all
> the time, but helps).
> 
> It must be a nightmare for usptream ctdb to try to handle all of this.

It is a bit challenging.  I thought I had it right...  :-)

> > So, choices are, in nfs-linux-kernel-callout:
> >
> > 1. Insert the following in service_stop() and service_start(), before
> >    each "# Default to stopping/starting by hand" comment:
> >
> >      case "$nfs_distro_style" in
> >      systemd-*) return
> >      esac  
> 
> Why does it matter if it's systemd or sysv in this case? I'm missing
> that bit of info. ctdb doesn't use systemctl, or call out to
> /etc/init.d/<name> directly as far as I can tell. It only uses the
> "service" call, which works for both systemd and sysv. Are you trying
> to support a deployment which has neither systemd or sysv?
> 
> Why not behave like basic_start() and basic_stop(), which just skip
> the service if the corresponding service variable isn't set? Sorry if
> I'm missing something, I know upstream has to consider many more
> deployment scenarios.

The "restart_every" count in the *.check files wants to be able
to trigger a restart of an individual service that isn't "healthy".
So, in the Sys-V init case, where a single init script starts many
services, that mechanism wants to be able to manually restart an
individual service.

So, the above suggestion by me is wrong because it would build more
implied behaviour into the code.

Instead, we need to go with "ugly".  Services that are automatically
started by some other init script should have a value of, say, "AUTO".
basic_stop() and basic_start() would ignore this, treating it like "".
However, service_stop() and service_start() would still do the
hand-stop/start as necessary.

I've implemented this at:

  https://git.samba.org/?p=martins/samba.git;a=shortlog;h=refs/heads/ctdb-nfs

This call-out should behave sanely if you set nfs_rquotad_service="".

I've also made the tests pass for Debian-style init/systemd, though they
are still not automatically run for all styles.  I also didn't add
tests for a modified call-out...  it works...

So the call-out will now be self-consistent.

I can also now see that I should have just had service_restart_cmd in
the *.check files and then I could have had a single service_restart
function for this purpose in the call-out, which could have just done
an OS level service restart for the case where the service is defined.
I won't do that now because it means I would have to maintain the old
code anyway for backward compatibility.  Live and learn...

After all of that, you should still make sure you remove
50.rquotad.check to avoid warnings like this being repeatedly logged:

  WARNING: rquotad failed RPC check:
  rpcinfo: RPC: Program not registered
  program rquotad version 1 is not available
  Trying to restart service "rquotad"...
  &Starting quotarpc: OK

> In the future maybe these variables should be factored our into a
> separate (or existing) config file, and sourced by all scripts, so
> that site local changes are made only there, and not in the actual
> script that is run, separating data and code. Otherwise in an upgrade
> which changes the script (code) there would be a config prompt (in
> debian/ubuntu), and I think in rpm systems the script would be backed
> up as .rpmsave, and either the old script would be run, or the new one
> but without the local site changes.

So far I have tried to make the NFS call-out script self-contained,
because loading configuration can cause extra complexity.  However, I
can see your point.  One problem is that the defaults are set depending
on $CTDB_NFS_DISTRO_STYLE and then the configuration should override
the defaults.  That's OK: we could just load the configuration file
twice - first to get CTDB_NFS_DISTRO_STYLE and a 2nd time to override
defaults.  It is better a repetitive check to see each value is set
before setting the default... or insane, unmaintainable shell eval magic
to avoid the repetition.

I might do that later.  It doesn't seem difficult and will make at
least 1 user's life easier...  :-)

I don't think we will treat any of this as a bug and backport it to
current release or the upcoming 4.16 release.  Removing
50.rquotad.check should be done if a service is disabled.  I should
probably make sure that is documented somewhere...

peace & happiness,
martin

