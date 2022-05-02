Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CE7516927
	for <lists+samba-technical@lfdr.de>; Mon,  2 May 2022 03:39:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=Cc:From:List-Id:Subject:To:Date;
	bh=eY2pfj9WNcnP4MQ+THIxaPwi58GB8qMC5v04ZLODAbI=; b=2BRoK1cWuuvB92JjojCtDXpoa7
	Hb/twM/wfEonjHE5iiHdgP/BjT/g7032VJ2OqU5triJ6Y0RBjmMjBzZnE5rzuuO9I5z4VOjTi0Ci3
	JKSWP3WkP6fZdxJZIKjI4XzRBoyoy1Ln8T1zuiEodqTsEm20jsNIyDJNoymjz70+6RpVnfUlvYmY1
	xZ2L/2AP9bhae6mr5i/38QquqHfklGCGb1CBj1/Q8tXuLPiL4aFC+IM0I24YV2Fc1YFlqTQZzQWT7
	ZVujx5zHKXLhlTW/+La/dpoQ4MjIWdvKTBZ5OnoRsS3iEdAknYHzBarebbPsUolYdUMgb9VRVEd6U
	DAEeh1tQ==;
Received: from ip6-localhost ([::1]:22320 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1nlL1J-005TnT-BX; Mon, 02 May 2022 01:38:37 +0000
Received: from mail.ozlabs.org ([2404:9400:2221:ea00::3]:53971
 helo=gandalf.ozlabs.org) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1nlL1F-005TnJ-0C
 for samba-technical@lists.samba.org; Mon, 02 May 2022 01:38:35 +0000
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest
 SHA256) (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4Ks5MF3ZFgz4xdK;
 Mon,  2 May 2022 11:38:01 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=meltin.net;
 s=202004; t=1651455481;
 bh=eY2pfj9WNcnP4MQ+THIxaPwi58GB8qMC5v04ZLODAbI=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=VBKo0xwQDLwafMvGyRtSKEs5XrtEvWjef2jgJWyipbxgsbZeivtdg5CbyvAlLbO5/
 BvmHVKCBwSCLnF2fCGtq4XyYgMLS1my5f9zPykaTjIKk5URt2R7Bhvqquax4Q92Twm
 kTDSb0mXzgg89XvwKnonkFgMqerz8oG9vBsNAZHzHngEDx6YJheMQatShv7OxFFqwJ
 1Kk1bHeBMTNNQLzR3lBIChgSEVPq0/EqV4y4MucNqwlhHe8nWXRyhOiH9B8CVAn6fF
 hVTScgjQRzwFKjt5+VMYq53/2Qc6+VMqZWWhAx07EQ6KzA5IXdn76apysKOWPslgPG
 p7ES1RDYJxA4w==
Date: Mon, 2 May 2022 11:38:00 +1000
To: samba-technical@lists.samba.org
Subject: Re: ctdb client python bindings
Message-ID: <20220502113800.25e21ed9@martins.ozlabs.org>
In-Reply-To: <CAB5c7xryFXvWwkWhfhwROU1yUwnjPgwSHXzgr65z0v=9FDGQMQ@mail.gmail.com>
References: <CAB5c7xrKB52rmAP9qPFxzjtCcBLvGsGiUn_ODz7QwQwrJ15o0A@mail.gmail.com>
 <CAJ+X7mTv5xR0J5e7OxLzhsnbHuB0wuECwL9Zn7pS+gu3LL2mBw@mail.gmail.com>
 <CAB5c7xrbN6UUuSOnOg+AHVeV6-VNQtgvHQ5KFqJKkF=X7LBxZQ@mail.gmail.com>
 <CAJ+X7mQUZKgaAf=ULXJezL1Up19sUK5JnRo4UcgOp1bb1bSdpw@mail.gmail.com>
 <CAB5c7xryFXvWwkWhfhwROU1yUwnjPgwSHXzgr65z0v=9FDGQMQ@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
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
Cc: Andrew Walker <awalker@ixsystems.com>
Errors-To: samba-technical-bounces@lists.samba.org
Sender: "samba-technical" <samba-technical-bounces@lists.samba.org>

Thanks to everyone on involved in this thread.  I'm time limited, so
will just reply to this message...

On Fri, 29 Apr 2022 09:09:23 -0400, Andrew Walker via samba-technical
<samba-technical@lists.samba.org> wrote:

> Hmm... do you have a general idea of the gross functionality you want to
> have separate daemon's for. I was already breaking up functionality into
> different classes in the bindings I was writing. E.g.
> 
> ctdb.Ctdb - interacting with databases
> ctdb.Node - interacting with cluster nodes
> ctdb.IP - interacting with public IP addresses

Looks sane.  :-)

Functionality won't necessarily map straight to functions, but some
structure would be a big improvement.

It is a little complicated:

* We will have a failover component that supports public IPs, LVS, NAT
  gateway, and whatever else the use defines.  However, I'm not sure we
  want to push all of these under "ctdb failover" in the tool.  It gets
  too verbose.

  One question here is whether we should change the terminology from
  "public addresses" to "virtual IPs" (VIPs).

* Things like version, uptime, ping, runstate, ... all just
  apply to nodes, so let's say "ctdb node".

* Tunables (and perhaps) capabilities should eventually go away.  Some
  will become script variables (all of the failover stuff), some will
  become config variables, some will go away.

So, for discussion:

* ctdb

  - version
  - status

* ctdb cluster

  - list (listnodes)
  - reload (reloadnodes)
  - leader
  - lock (getreclock)
  - recover

* ctdb node
  - uptime
  - ping
  - status (nodestatus)
  - runstate
  - pnn
  - pid (getpid)
  - disable
  - enable
  - pause (stop) [please!]
  - continue
  - ban
  - unban
  - shutdown
  - capability list (getcapabilities)
  - capability get (getcapabilities, just 1)
  - capability set (setlmasterrole)
  - capability set (setleaderrole)
  - dumpmemory
  - dumpmemory recoverd (rddumpmemory)
  - checkpid (process-exists)

* ctdb tunable
  - get (getvar)
  - set (setvar)
  - list (listvars)

* ctdb ips (or ctdb vip?)

  - list (ip)
  - info (ipinfo)
  - iface list (ifaces)
  - iface set (setifacelink)
  - reload (reloadips)
  - reallocate (ipreallocate)

* ctdb db
  - list (getdbmap)
  - info (some of getdbstatus)
  - status (some of getdbstatus)
  - statistics (dbstatistics) [+ without DB name does global DB stats]
  - attach
  - detach
  - backup (backupdb)
  - restore (restoredb)
  - dumpbackup (dumpdbbackup)
  - wipe (wipedb)
  - seqnum (getdbseqnum)
  - cat (catdb)
  - key get (readkey, pfetch)
  - key set (writekey, pstore)
  - key delete (deletekey, pdelete)
  - key batch (ptrans, also extended for volatile)
  - flag set (setdbreadonly, setdbsticky)
  - flag get (some of getdbstatus)
  - tdb cat
  - tdb get
  - tdb set

I know I'm close, but I need to stop and get on with other things.
Remaining commands are:

  lvs             leader|list|status           show lvs configuration
  setdebug        ERROR|WARNING|NOTICE|INFO|DEBUG  set debug level
  getdebug                                     get debug level
  statistics                                   show ctdb statistics
  statisticsreset                              reset ctdb statistics
  stats           [count]                      show rolling statistics


  gratarp         <ip> <interface>             send a gratuitous arp
  tickle          <srcip:port> <dstip:port>    send a tcp tickle ack
  gettickles      <ip> [<port>]                get the list of tickles
  addtickle       <ip>:<port> <ip>:<port>      add a tickle
  deltickle       <ip>:<port> <ip>:<port>      delete a tickle
  moveip          <ip> <node>                  move an ip address to another node
  addip           <ip/mask> <iface>            add an ip address to a node
  delip           <ip>                         delete an ip address from a node

  event                                        event and event script commands
  scriptstatus    [init|setup|startup|monitor|takeip|releaseip|ipreallocated]  show event script status
  natgw           leader|list|status           show natgw configuration
  checktcpport    <port>                       check if a service is bound to a specific tcp port or not

If someone is really thinking about doing this, then please consider
the following.  Some aren't needed in version 1, but if they're kept in
mind then they should be easier to add later.

* Nested --help

* Interactive with only a single connect, potentially with readline +
  completions - could allow stepping down into commands to allow
  relative sub-commands, as well as allowing long commands

* JSON output - sorry, have meant to reply about this before

* Loop mode for JSON output - we don't have to support JSON on the
  wire, but keeping a connection to take commands and spit out JSON
  might be very helpful

* bash completion file

Gee... it is huge.  Perhaps we need a wiki page to keep track...

peace & happiness,
martin

