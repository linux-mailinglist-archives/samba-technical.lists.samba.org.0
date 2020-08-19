Return-Path: <samba-technical-bounces@lists.samba.org>
X-Original-To: lists+samba-technical@lfdr.de
Delivered-To: lists+samba-technical@lfdr.de
Received: from hr1.samba.org (hr1.samba.org [IPv6:2a01:4f8:192:486::1:0])
	by mail.lfdr.de (Postfix) with ESMTPS id 37CBF2497E5
	for <lists+samba-technical@lfdr.de>; Wed, 19 Aug 2020 10:03:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.samba.org; s=2954282; h=From:List-Id:Date:Subject:To:cc;
	bh=snJY74Wh0TxgqNoCOVWbJNFEDGCMYdr3+cZcp8hvoxU=; b=zKWTWpLdg6nWUubvQ3UReMZa0/
	Rkw7ePs+w6Al4IfTUJjbBVX3wJzhRfpHab9LJGB4x2CzppvqT4I2wTVSAQH0PkOh8/rRdVpy6vqib
	91LmJWX5Iidszs1T7i5xDJbTVjybz8IKMmC52slu6830Ep/T6amDNcowO0+r7Hx/UEEmp8c0YEwff
	rovoAikQ83jm3xJIn4wXyGMUrvAJKrjQ6fc23kufxi0UJvpu8K6nt7snsJDktqbwp9CITXeHFUwxN
	/1QcHFZ0leWbTBU0BcEL/hD2QcbnmKp0F9eeXqcxpd0mlbyRShsILu9dIoNR6YazISGC7k9X5vSHO
	azpSNuCA==;
Received: from localhost ([::1]:65524 helo=hr1.samba.org) 
	by hr1.samba.org with esmtp (Exim)
	id 1k8J2z-00EGNg-KH; Wed, 19 Aug 2020 08:02:13 +0000
Received: from hr2.samba.org ([2a01:4f8:192:486::2:0]:46232) 
 by hr1.samba.org with esmtps (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8J2s-00EGNZ-4g
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 08:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=samba.org; 
 s=42; h=Message-ID:Date:To:From:CC;
 bh=snJY74Wh0TxgqNoCOVWbJNFEDGCMYdr3+cZcp8hvoxU=; b=2flGkdNpRE57WzMShX3n37hDxc
 BMGOENIzaIh7o2V00qdjB7gnY48VkLglD/dc3Q3uOLpaxU7Z36xUUkyJhQQM4VRQ89W2RBCwcQ49b
 HTlR4FVVRaC7gMBueBbf7Z23FhWe9bSp68udobd6JcYts0n33GCbON4eF4gm/czKo356umPE4Txrg
 7ElCajcjQuu7e/hAtQHZjsKBCvK+20OCh6QHRsWf5vxsj0YOPWK9n2PmIQhTFJsM2jXZI9zplCEpY
 2adHi1aX4Fawii/bBsECSvmREyXDVMHI3bdPSyaxxIChmT32WfAZ/lk1XZgN8y+X3irY+zSX5RNl1
 WtlyZfmmyoW/pbHkzmmirLi8A9mUgsrfqplb0NEpYeFzdgYu96pIzg1HPb8XzWkC7hKDyn1V9xTaf
 tG/Ing29qdy5Hy4syll2vXxPAJ8GMzznU066hQMxTs1B0D7cae+y6UX13kTXLjIziIDkKZKvKe7QR
 gbiAAWvk/iIYg9XBuNkbvN8z;
Received: from [127.0.0.2] (localhost [127.0.0.1])
 by hr2.samba.org with esmtpsa (TLS1.3:ECDHE_RSA_CHACHA20_POLY1305:256)
 (Exim) id 1k8J2r-0006g4-CZ
 for samba-technical@lists.samba.org; Wed, 19 Aug 2020 08:02:05 +0000
To: samba-technical@lists.samba.org
Subject: WIP: Samba's client command line UI
Date: Wed, 19 Aug 2020 10:02:05 +0200
Message-ID: <3749194.YmznvRLumo@magrathea>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart1774722.N7VKTTCEG9"
Content-Transfer-Encoding: 7Bit
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

This is a multi-part message in MIME format.

--nextPart1774722.N7VKTTCEG9
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hi,

I'm working to cleaning up the mess we have with our client cmdline UI [1].

Currently we have a source3 and a source4 parsing implementation. I have 
rewritten the command line parsing code. The only real difference between the 
two is only how the config file is loaded. So I created a s3 and s4 config 
loader and that's it.

The big change is that we need new options to fix a lot of issues face: The 
biggest change is probably about Kerberos:

	--use-kerberos=yes|auto|no

New is that we have options to correctly request signing and encryption:

      --gensec-client-protection=plain|sign|seal

      --smb-signing=off|if_required|desired|required
      --smb-ipc-signing=off|if_required|desired|required
      --smb-encryption=off|if_required|desired|required

You can find the code at [2].


	NOTE that this is still work in progress and no all the stuff is
	wired correctly yet!


But I wanted to show you what I'm working on and you can comment. Using that 
parser will break the command line options for **all** client tools. But I 
think it is worth the effort, see [1].

Attached is the output of

	smbclient --help

which I just migrated to give you a full example of the new parser.


Feedback is welcome :-)


	Andreas


[1] https://sambaxp.org/archive_data/sxp19/SambaXP2019-SLIDES/dbagnall-what-should-we-do-with-our-ui.pdf
[2] https://git.samba.org/?p=asn/samba.git;a=shortlog;h=refs/heads/master-cli-creds

-- 
Andreas Schneider                      asn@samba.org
Samba Team                             www.samba.org
GPG-ID:     8DFF53E18F2ABC8D8F3C92237EE0FC4DCC014E3D
--nextPart1774722.N7VKTTCEG9
Content-Disposition: attachment; filename="smclient.txt"
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="UTF-8"; name="smclient.txt"

Usage: smbclient [OPTIONS] service <password>
  -R, --name-resolve=NAME-RESOLVE-ORDER                      Use these name
                                                             resolution
                                                             services only
  -M, --message=HOST                                         Send message
  -I, --ip-address=IP                                        Use this IP to
                                                             connect to
  -E, --stderr                                               Write messages to
                                                             stderr instead of
                                                             stdout
  -L, --list=HOST                                            Get a list of
                                                             shares available
                                                             on a host
  -T, --tar=<c|x>IXFvgbNan                                   Command line tar
  -D, --directory=DIR                                        Start from
                                                             directory
  -c, --command=STRING                                       Execute semicolon
                                                             separated commands
  -b, --send-buffer=BYTES                                    Changes the
                                                             transmit/send
                                                             buffer
  -t, --timeout=SECONDS                                      Changes the
                                                             per-operation
                                                             timeout
  -p, --port=PORT                                            Port to connect to
  -g, --grepable                                             Produce grepable
                                                             output
  -q, --quiet                                                Suppress help
                                                             message
  -B, --browse                                               Browse SMB
                                                             servers using DNS

Help options:
  -?, --help                                                 Show this help
                                                             message
      --usage                                                Display brief
                                                             usage message

Common Samba options:
  -d, --debuglevel=DEBUGLEVEL                                Set debug level
      --debug-stderr                                         Send debug output
                                                             to STDERR
  -s, --configfile=CONFIGFILE                                Use alternative
                                                             configuration file
      --option=name=value                                    Set smb.conf
                                                             option from
                                                             command line
  -l, --log-basename=LOGFILEBASE                             Basename for
                                                             log/debug files
      --leak-report                                          enable talloc
                                                             leak reporting on
                                                             exit
      --leak-report-full                                     enable full
                                                             talloc leak
                                                             reporting on exit

Connection options:
  -R, --name-resolve=NAME-RESOLVE-ORDER                      Use these name
                                                             resolution
                                                             services only
  -O, --socket-options=SOCKETOPTIONS                         socket options to
                                                             use
  -n, --netbiosname=NETBIOSNAME                              Primary netbios
                                                             name
  -W, --workgroup=WORKGROUP                                  Set the workgroup
                                                             name
      --realm=REALM                                          Set the realm name
  -i, --scope=SCOPE                                          Use this Netbios
                                                             scope
  -m, --maxprotocol=MAXPROTOCOL                              Set max protocol
                                                             level

Credential options:
  -U, --user=[DOMAIN/]USERNAME[%PASSWORD]                    Set the network
                                                             username
  -N, --no-pass                                              Don't ask for a
                                                             password
      --password=STRING                                      Password
  -A, --authentication-file=FILE                             Get the
                                                             credentials from
                                                             a file
  -P, --machine-pass                                         Use stored
                                                             machine account
                                                             password
      --simple-bind-dn=DN                                    DN to use for a
                                                             simple bind
      --use-kerberos=yes|auto|no|default                     Use Kerberos
                                                             authentication
      --use-krb5-ccache=CCACHE                               Credentials cache
                                                             location for
                                                             Kerberos
  -C, --use-winbind-ccache                                   Use the winbind
                                                             ccache for
                                                             authentication
      --gensec-client-protection=plain|sign|seal             Configure gensec
                                                             client protection
      --smb-signing=off|if_required|desired|required         Configure SMB
                                                             singing
      --smb-ipc-signing=off|if_required|desired|required     Configure SMB
                                                             singing
      --smb-encryption=off|if_required|desired|required      Configure SMB
                                                             encrpytion

Version options:
  -V, --version                                              Print version

--nextPart1774722.N7VKTTCEG9--




